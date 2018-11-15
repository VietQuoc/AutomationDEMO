import requests
import json

def update_account_info_via_api(session, title, name, location, day=30, month=12, year=1994, gender='Nam'):
    ses = session
    
    if gender == 'Nam':
        gendernum=1
    else:
        gendernum=0
    
    headers = {'Content-Type': 'application/x-www-form-urlencoded'}
    datas = {
        "Title":title.encode(encoding='UTF-8'),
        "Name":name.encode(encoding='UTF-8'),
        "BirthdayDay":day,
        "BirthdayMonth":month,
        "BirthdayYear":year,
        "Gender":gendernum,
        "Location":location.encode(encoding='UTF-8'),
        "IdCard": '',
        "IdPlace": '',
        "IdDateDay": '', 
        "IdDateMonth": '', 
        "IdDateYear": ''
    }
    r = ses.post(url='https://gamevui.vn/account/profile',data=datas)
    if r.status_code == 200:
        print('Call API to update user info success')
    else:
        print('Call API fail!')
    
def get_session_api(username, password):
    ses = requests.Session()
    headers = {'Content-Type': 'application/x-www-form-urlencoded'}
    r = ses.post('https://gamevui.vn/account/login', data='UserName='+username+'&Password='+password, allow_redirects=False, headers=headers)
    return ses
