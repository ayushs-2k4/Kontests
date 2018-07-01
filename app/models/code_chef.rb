require 'nokogiri'

class CodeChef < ApplicationRecord
  self.pluralize_table_names = false
  self.primary_key = :code

  BASE_URL = 'https://www.codechef.com'

  def to_param
    code.parametarize   
  end

  def self.update_contests
    # request codechef contests page
    contests = Nokogiri::HTML(open('https://www.codechef.com/contests', 'User-Agent' => USER_AGENT).read).css('.dataTable')[1].css('tbody > tr')

    # delete old contests from database
    delete_all

    # add contests
    contests.each do |contest|
      tds = contest.css('> td')
  
      create(code: tds[0].text,
             name: '<a href="%s" target="_blank">%s</a>' % [BASE_URL + tds[1].css('a').first['href'], tds[1].text],
             start_time: tds[2].text,
             end_time: tds[3].text)
    end
  end
end