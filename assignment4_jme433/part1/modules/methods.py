#!/usr/bin/python

import os
import requests, json
from datetime import datetime

# url of weather forcast 
base_url = 'https://api.open-meteo.com/v1/forecast'

def draw_banner(text, font):
    banner = f'figlet -f {font} {text}'
    output = os.popen(banner).read()
    return output

def menu_option1_handler():
    # latitude and longitude
    # Douglas College (New Westminter Campus)
    latitude = 49.2497
    longitude = -123.1193

    query_params = {
    'latitude' : latitude,
    'longitude' : longitude,
    'hourly' : 'temperature_2m,precipitation'
    }

    response = requests.get(base_url, params=query_params)

    if response.status_code == 200:
        data = response.json()
        # export json data as json file
        with open('output_part1_jme433.json', 'w') as json_file:
            json.dump(data, json_file, indent=4)
    else:
        print('Failed to fetch weather data.')
    
    
def menu_option2_handler():
    # check validity of longitude
    while(True):
        try:
            longitude = float(input("Enter the longitude[-180,180]: "))
            
            if -180 <= longitude <= 180:
                break
            else:
                print("Please enter a number between -180 and 180.")
                continue
        except Exception:
            print("Please enter a valid number.")

    # check validity of latitude
    while(True):
        try:
            latitude  = float(input("Enter the latitude[-90,90]: "))
        
            if -90 <= latitude <= 90:
                break
            else:
                print("Please enter a number between -90 and 90.")
                continue
        except Exception:
            print("Please enter a valid number.")

    query_params = {
    'latitude' : latitude,
    'longitude' : longitude,
    'hourly' : 'temperature_2m'
    }

    response = requests.get(base_url, params=query_params)

    if response.status_code == 200:
        weather_data = response.json()

        time_list = weather_data['hourly']['time']
        temperature_list = weather_data['hourly']['temperature_2m']

        hour = 6
        print("\nThe temperature of next 6 hours: ")
        for time, temperature in zip(time_list, temperature_list):
            if hour > 0:
                print(f"Time: {time}, Temp: {temperature}°C")
                hour -= 1    
    else:
        print('Failed to fetch weather data.')






        
    
    
