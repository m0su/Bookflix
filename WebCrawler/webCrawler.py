from bs4 import BeautifulSoup
import requests

lis = []

def get_html(url):
  _html = ""
  resp = requests.get(url)
  if resp.status_code == 200:
    _html = resp.text
    return _html

def parse_html(html):
  bs = BeautifulSoup(html, 'html.parser')
  book_area = bs.find("table", {"class":"list_ranking"})
  books = book_area.findAll("div", {"class":"tit3"})
  rank = 0
  for book in books:
    rank += 1
    title = book.find('a')['title']
    img = "https://movie.naver.com/" +book.find('a')['href']
    lis.append([rank, title, img])
  return lis



# url = 'https://movie.naver.com/movie/sdb/rank/rmovie.nhn'
url = "https://movie.naver.com/movie/sdb/rank/rmovie.nhn"
# url = 'https://pyony.com/ebooks/ridiselect/'
html = get_html(url)
data = parse_html(html)
print(data)

