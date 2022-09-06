import library
import requests

from sql_app.crud import get_locations
from sql_app.database import SessionLocal
from sql_app import schemas, models
from typing import List

db = SessionLocal()
locations: List[models.Location] = get_locations(db)
db.close()
location_names = []
for location in locations:
    location_names.append(location.lms_location_name)

amo_ids = [
    1791455,
    1805157,
    1741809,
    1774160,
    1794439,
    1791425,
    1812338,
    1801669,
    1803903,
    1805387,
    1805709,
    1702459,
    1763325,
    1794168,
    621960,
    1799488,
    1407227,
    1793635,
    1794586,
    1781152,
    1793838,
    1726260,
    1808459,
    1794349,
    1794236,
    1779640,
    1223742,
    1800798,
    1677022,
    1790401,
    1448307,
    1804514,
    1809693,
    1370091,
    1733025,
    964174,
    1775330,
    1809300,
    1730166,
    1804302,
    1794837,
    1802140,
    1807884,
    1793854,
    1805281,
    1808459,
    1780649,
    1781369,
    1801669,
    1793119,
    1806375,
    1776549,
    1809983,
    1780055,
    1793574,
    1794245,
    1785197,
    1805411,
    1794220,
    1794233,
    1725464,
    1782258,
    1783002,
    1786511,
    1794440,
    1794445,
    1728583,
    1783002,
    1786511,
    1799920,
    1810016,
    1810002,
    1742626,
    1719988,
    1721170,
    1765698,
    1678440,
    1773455,
    1712769,
    1795351,
    716939,
    1711680,
    1719947,
    1793799,
    1714819,
    1793933,
    1807885,
    1790939,
    1793970,
    634471,
    1681718,
    1767845,
    1799220,
    1797415,
    1732322,
    1805575,
    1790948,
    1790972,
    1806887,
    1682196,
    1802508,
    1729180,
    1801268,
    766629,
    1715550,
    1790958,
    1799915,
    1796409,
    1768429,
    1795348,
    1457632,
    1793800,
    1480722,
    1794523,
    1812499,
    1803004,
    1720436,
    1775500,
    1678176,
    1681583,
    1782286,
    1794238,
    1742767,
    1773806,
    1801725,
    1802504,
    1714529,
    1794105,
    1805106,
    1775491,
    1723158,
    1793900,
    1728910,
    1804514,
    1464243,
    1799201,
    1804931,
    1805023,
    1794113,
    1671237,
    1685054,
    1794888,
    1794952,
    1795209,
    1763950,
    1795216,
    1793107,
    1795254,
    1811184,
    1797315,
    1808938,
    719909,
    1809065,
    1805316,
    1781871,
    1795061,
    1804518,
    1809018,
    1794038,
    1726616,
    1798075,
    1794002,
    1243854,
    1774943,
    656550,
    1787924,
    1115744,
    1794421,
    1809135,
    1810151,
    1795348,
    1770761,
]
results = {}
for location in locations:
    if location.regional_manager not in results:
        results[location.regional_manager] = { location.lms_location_name: {"TM": location.territorial_manager, "KM": location.client_manager, "IDS": []} }
    else:
        results[location.regional_manager][location.lms_location_name] = {"TM": location.territorial_manager, "KM": location.client_manager, "IDS": []}
for id in amo_ids:
    url = f"https://lms.logikaschool.com/api/v2/student/default/view/{id}?id={id}&expand=lastGroup%2Cwallet%2Cbranch%2ClastGroup.branch%2CamoLead%2Cgroups%2Cgroups.b2bPartners"
    resp = requests.get(url, headers=library.headers)
    data = resp.json()["data"]
    if not data["fullName"].startswith("user"):
        group_id = data["lastGroup"]["id"]
        group_url = f"https://lms.logikaschool.com/api/v1/group/{group_id}?expand=venue%2Cteacher%2Ccurator%2Cbranch"
        respons = requests.get(group_url, headers=library.headers)
        group_data = respons.json()["data"]
        try:
            group_location = group_data["venue"]["title"]
        except:
            print("UNABLE TO LOCATE STUDENT", id, group_id)
        else:
            if group_location not in location_names:
                print("Location not in list", id, group_id, group_location)
                continue
            for loc in locations:
                if loc.lms_location_name == group_location:
                    results[loc.regional_manager][group_location]["IDS"].append(f"https://lms.logikaschool.com/student/update/{id}")
                    print(results[loc.regional_manager][group_location])
                    break







