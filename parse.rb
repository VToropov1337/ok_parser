require 'net/http'
require 'uri'
require 'nokogiri'

url = "https://www.okeydostavka.ru/msk/catalog"
uri = URI.parse(url)

response = Net::HTTP.get(uri)
response.force_encoding('utf-8')

html_document = Nokogiri::HTML(response)

html_document.css('ul#allDepartmentsMenu').each do |ul_allDepartmentsMenu|
  
                      ul_allDepartmentsMenu.children.each do |li_allDepartmentsMenu|
                          li_allDepartmentsMenu.children.each do |category|
                            if category.name == 'a'
                              puts "====>" + category.text.strip #Cat 1
                                             
                            li_allDepartmentsMenu.children.each do |category|
                                                   # next if category.name != 'div'
                                                    
                                                  category.children.each do |ul_categoryList|
                                                    ul_categoryList.children.each do |li_categoryList|
                                                      li_categoryList.children.each do |subcat|
                                                        if subcat.name == 'a'
                                                          puts "============>" + subcat.text.strip #Cat 2
                                                          
                                                                li_categoryList.children.each do |ul_subcategoryList|
                                                                  ul_subcategoryList.children.each do |li_subcategoryList|
                                                                    li_subcategoryList.children.each do |podcat|
                                                                      if podcat.name == 'a'
                                                                        puts "=====================>" + podcat.text.strip #Cat 3
                                                        end
                                                      end
                                                    end
                                                  end
                                                end
                                              end
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              
                          
    
        
   
          