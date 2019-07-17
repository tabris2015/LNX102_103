#

# registrarse en https://darksky.net/dev/register

#secret key a2984916f68470a636880f5d1f0f02f1

# https://api.darksky.net/forecast/[key]/[latitude],[longitude]

# ubicacion @-16.5087506,-68.1263359
import requests
import json

SECRET_KEY = 'a2984916f68470a636880f5d1f0f02f1'
LATITUD = '-16.5087506'
LONGITUD = '-68.1263359'

url = 'https://api.darksky.net/forecast/' + SECRET_KEY + '/' + LATITUD + ',' + LONGITUD
r = requests.get(url)

if r.status_code == 200:
    content_dic = json.loads(r.content)
    out_str = str(content_dic['currently']['time']) +':' + content_dic['timezone'] + ', Temperatura:'  + str(content_dic['currently']['temperature']) + '[F], Resumen: ' + content_dic['currently']['summary'] + '\n'
    print out_str
    f = open('/var/log/clima.log', 'a+')
    f.write(out_str)

else:
    print 'API no disponible'
