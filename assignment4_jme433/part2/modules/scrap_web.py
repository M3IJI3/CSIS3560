#!/usr/bin/python

import bs4, requests, json

def scrap_websites():
    # make a http request and parse the html content
    page = requests.get('https://www.douglascollege.ca/current-students/important-dates-information/exam-schedule')
    page.raise_for_status()
    soup = bs4.BeautifulSoup(page.text,'html.parser')
    

    table = soup.find('table')

    list = []

    rows = table.find_all("tr")
    for row in rows[1:]:
        columns = row.find_all("td")

        data = {
            "course"     : columns[0].text.strip(),
            "section"    : columns[1].text.strip(),
            "instructor" : columns[2].text.strip(),
            "date"       : columns[3].text.strip(),
            "begin_time" : columns[4].text.strip(),
            "end_time"   : columns[6].text.strip(),
            "bldg"       : columns[7].text,
            "room"       : columns[8].text
        }

        list.append(data)

    
    
    with open('output_part2_jme33.json','w', encoding='utf-8') as json_file:
        json.dump(list, json_file, ensure_ascii=False, indent=4)

scrap_websites()