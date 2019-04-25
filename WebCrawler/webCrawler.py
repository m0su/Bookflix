from bs4 import BeautifulSoup
import requests
import csv
import json



def get_html(url):
  _html = ""
  resp = requests.get(url)
  if resp.status_code == 200:
    _html = resp.text
    return _html

def parse_html(html):
  bs = BeautifulSoup(html, 'html.parser')
  temp_list = []
  temp_dict = {}
  book_area = bs.find("table", {"class":"list_ranking"})
  books = book_area.findAll("div", {"class":"tit3"})
  rank = 0
  for book in books:
    rank += 1
    title = book.find('a')['title']
    img = "https://movie.naver.com/" +book.find('a')['href']
    temp_list.append([rank, title, img])
    temp_dict[str(rank)] = {'img':img, 'title':title, 'rank':rank}
  return temp_list, temp_dict

##################################################
# File Maker Start: CSV, JSON
##################################################
# def toCSV(b_list):
#   with open('b_chart.csv', 'w', encoding='utf-8', newline='') as file :
#     csvfile = csv.writer(file)
#       for row in b_list:
#         csvfile.writerow(row)

def toJSON(b_dict):
  with open('b_chart.json', 'w', encoding='utf-8') as file :
    json.dump(b_dict, file, ensure_ascii=False, indent='\t')
##################################################
# File Maker End
##################################################

##################################################
# Main Start
##################################################
b_list = []
b_dict = {}
url = "https://movie.naver.com/movie/sdb/rank/rmovie.nhn"

html = get_html(url)


b_temp = parse_html(html)
b_list += b_temp[0]
b_dict = dict(b_dict, **b_temp[1])

for item in b_list :
  print(item)

for item in b_dict :
  print(item, b_dict[item]['title'], b_dict[item]['rank'], b_dict[item]['img'])

# toCSV(b_list)
toJSON(b_dict)
##################################################
# Main End
##################################################
