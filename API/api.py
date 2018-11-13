import requests
import json

def update_account_info_via_api(cookie, title, name, location, day=30, month=12, year=1994, gender=1):
    ses = requests.Session()
    ses.cookies = cookie
    headers = {'Content-Type': 'application/x-www-form-urlencoded'}
    datas = {
        "Title":title.encode(encoding='UTF-8'),
        "Name":name.encode(encoding='UTF-8'),
        "BirthdayDay":day,
        "BirthdayMonth":month,
        "BirthdayYear":year,
        "Gender":gender,
        "Location":location.encode(encoding='UTF-8'),
        "IdCard": '',
        "IdPlace": '',
        "IdDateDay": '', 
        "IdDateMonth": '', 
        "IdDateYear": ''
    }
    r = ses.post(url='https://gamevui.vn/account/profile',data=datas)
    print(r.status_code)
    
def get_cookie(username, password):
    ses = requests.Session()
    headers = {'Content-Type': 'application/x-www-form-urlencoded'}
    r = ses.post('https://gamevui.vn/account/login', data='UserName='+username+'&Password='+password, allow_redirects=False, headers=headers)
    print(r.status_code)
    return ses.cookies
