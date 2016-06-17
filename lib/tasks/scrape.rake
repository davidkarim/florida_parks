
namespace :scrape do
  desc "Scrape list of Florida parks from the Florida State Parks website"
  task fl_parks: :environment do

    base_url = "https://www.floridastateparks.org"
    url = base_url + "/parks-and-trails?type[0]=park"
    links = []
    park_names = []
    addresses1 = []
    addresses2 = []
    phone_nums = []
    detail_desc = []

    finished = nil
    until finished
      #finished = 1
      response = HTTParty.get url

      if response.code == 200
        dom = Nokogiri::HTML(response.body)
      else
        puts "Error; response code #{response.code}"
        exit
      end

      # Navigate through all the parks on current page
      counter = 1
      element_obj = ""
      until !element_obj
        # Scrape for park name & park detail link
        element_obj = dom.xpath("//*[@id='block-system-main']/div/div[3]/div[#{counter}]/div/div/div/a").first
        if element_obj
          links << element_obj.get_attribute(:href)
          park_names << element_obj.content
          print "."
        end

        # Scrape for address
        address_obj = dom.xpath("//*[@id='block-system-main']/div/div[3]/div[#{counter}]//div[@class='park-list-info']/address").first
        if address_obj
          addresses1 << address_obj.element_children[0].content
          addresses2 << address_obj.element_children[1].content
        end

        # Scrape for phone number
        phone_obj = dom.xpath("//*[@id='block-system-main']/div/div[3]/div[#{counter}]//div[@class='park-list-info']/span[@class='park-list-phone']").first
        if phone_obj
          phone_nums << phone_obj.content
        end
        counter += 1
      end

      # Scrape for link to next page
      next_url_obj = dom.xpath("//*[@id='block-system-main']/div/div[4]/ul//a[@title='Go to next page']").first
      if next_url_obj
        next_url = next_url_obj.get_attribute(:href)
        url = base_url + next_url
      else
        finished = 1
      end
    end

    puts "\nObtaining park details."
    # Navigate details pages for every park
    finished = nil
    counter = 0
    until finished || !links[counter]
      #finished = 1
      url = base_url + links[counter]
      response = HTTParty.get url

      if response.code == 200
        dom = Nokogiri::HTML(response.body)
      else
        puts "Error; response code #{response.code}"
        exit
      end

      element_obj = dom.xpath("//*[@id='block-system-main']//div[@class='views-field views-field-field-description']").first
      if element_obj
        detail_desc << element_obj.content.strip.chomp
        print "."
      else
        finished = 1
      end
      counter +=1
    end

    puts "\nPopulating database."
    # Populate database with scraped info
    park_names.count.times.each do |i|
      address = addresses1[i]
      city = addresses2[i].split(",").fetch(-2).strip
      state = addresses2[i].split(",").last.split(" ").first
      zip = addresses2[i].split(",").last.split(" ").last
      park_url = base_url + links[i]
      Park.create(name: park_names[i], address: address, city: city, state: state, zip: zip, phone_number: phone_nums[i], park_url: park_url, description: detail_desc[i])
    end
  end

end
