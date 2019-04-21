import requests
from bs4 import BeautifulSoup


def get_html(url):
  _html = ""
  resp = requests.get(url)
  if resp.status_code == 200:
    _html = resp.text
    return _html


def parse_html(html):
  book_list = list()
  soup = BeautifulSoup(html, 'html.parser', from_encoding='utf-8')
  # book_area = soup.find_all("div", {"class": "tit3"})
  book_area = soup.select("div", {"class": "tit3"})
  # translate_data(book_area)
  return book_area
  for book_index in book_area:
    info_soup = book_index.find("a")
    _url = info_soup["href"]
    _text = info_soup.title
    _title = ""
    _num = _text[0]
    if len(_text) > 1:
      _title = _text[1]

      book_list.append((_num, _title, _url, ))
  return book_list

def translate_data(input):
  trans = input.encode('utf-8')
  trans = trans.decode('unicode_escape')
  return trans

url = 'https://movie.naver.com/movie/sdb/rank/rmovie.nhn'
html = get_html(url)
data = parse_html(html)
print(data)
