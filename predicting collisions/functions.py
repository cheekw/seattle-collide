import pandas as pd
import numpy as np
from astral import Astral


def hours_of_daylight(date, axis=23.44, latitude=47.61):
    
    """Compute the hours of daylight for the given date"""
    
    days = (date - pd.datetime(2000, 12, 21)).days
    m = (1. - np.tan(np.radians(latitude))
         * np.tan(np.radians(axis) * np.cos(days * 2 * np.pi / 365.25)))
    return 24. * np.degrees(np.arccos(1 - np.clip(m, 0, 2))) / 180.



def isNight(DATETIME):
    
    """Returns 1 if the given time is the night time"""
    
    a = Astral()
    city = a['Seattle']
    sun = city.sun(date=DATETIME)
    if((DATETIME.hour > sun['sunrise'].hour) & (DATETIME.hour < sun['sunset'].hour)):
        return 0
    else:
        return 1

    
def isDay(DATETIME):
    
    """Returns 1 if the given time is the day time"""
        
    a = Astral()
    city = a['Seattle']
    sun = city.sun(date=DATETIME)
    if((DATETIME.hour > sun['sunrise'].hour) & (DATETIME.hour < sun['sunset'].hour)):
        return 1
    else:
        return 0


def predict_collisions(PRCP, TMAX, TMIN, DATETIME):
    
    """Predicts number of collisions using the model created"""
    
    features = pd.DataFrame({'PRCP': PRCP, 'TMAX': TMAX, 'TMIN': TMIN,
                         'daylight_hrs': hours_of_daylight(DATETIME, axis=23.44, latitude=47.61),
                         'weekofyear_1': 0, 'weekofyear_2': 0,
                         'weekofyear_3': 0, 'weekofyear_4': 0, 'weekofyear_5': 0, 'weekofyear_6': 0,
                         'weekofyear_7': 0, 'weekofyear_8': 0, 'weekofyear_9': 0, 'weekofyear_10': 0,
                         'weekofyear_11': 0, 'weekofyear_12': 0, 'weekofyear_13': 0, 'weekofyear_14': 0,
                         'weekofyear_15': 0, 'weekofyear_16': 0, 'weekofyear_17': 0, 'weekofyear_18': 0,
                         'weekofyear_19': 0, 'weekofyear_20': 0, 'weekofyear_21': 0, 'weekofyear_22': 0,
                         'weekofyear_23': 0, 'weekofyear_24': 0, 'weekofyear_25': 0, 'weekofyear_26': 0,
                         'weekofyear_27': 0, 'weekofyear_28': 0, 'weekofyear_29': 0, 'weekofyear_30': 0,
                         'weekofyear_31': 0, 'weekofyear_32': 0, 'weekofyear_33': 0, 'weekofyear_34': 0,
                         'weekofyear_35': 0, 'weekofyear_36': 0, 'weekofyear_37': 0, 'weekofyear_38': 0,
                         'weekofyear_39': 0, 'weekofyear_40': 0, 'weekofyear_41': 0, 'weekofyear_42': 0,
                         'weekofyear_43': 0, 'weekofyear_44': 0, 'weekofyear_45': 0, 'weekofyear_46': 0,
                         'weekofyear_47': 0, 'weekofyear_48': 0, 'weekofyear_49': 0, 'weekofyear_50': 0,
                         'weekofyear_51': 0, 'weekofyear_52': 0, 'weekofyear_53': 0, 'dayofweek_0': 0,
                         'dayofweek_1': 0, 'dayofweek_2': 0, 'dayofweek_3': 0, 'dayofweek_4': 0,
                         'dayofweek_5': 0, 'dayofweek_6': 0, 'month_1': 0, 'month_2': 0, 'month_3': 0,
                         'month_4': 0, 'month_5': 0, 'month_6': 0, 'month_7': 0, 'month_8': 0, 'month_9': 0,
                         'month_10': 0, 'month_11': 0, 'month_12': 0,
                         'LIGHTCOND_Day': isDay(DATETIME),
                         'LIGHTCOND_Night': isNight(DATETIME)},
                         index=[1])


    features[features.columns[3 + DATETIME.isocalendar()[1]]] = 1
    features[features.columns[57 + DATETIME.weekday()]] = 1
    features[features.columns[63 + DATETIME.month]] = 1
    
    return features