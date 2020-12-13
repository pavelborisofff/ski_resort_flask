# import datetime
#
# # Convert UTC time format to local\
# # datetime.tzinfo.tzname()
# # time_to_parse = '2020-12-11T21:06:52Z'
# # utc_time = datetime.datetime.fromisoformat(time_to_parse[:-1])
# # local_time = pytz.utc.localize(utc_time, is_dst=None).astimezone(pytz.timezone(TZ))
#
#
# def get_strftime(diff_to_utc: int = -3) -> list[str]:
#     """
#     Generate keys to search exactly time periods into yr.no data
#     :param diff_to_utc:
#     :return:
#     """
#     template = '{}-{:0>2}-{:0>2}T{:0>2}:00:00Z'
#     today = datetime.datetime.now() + datetime.timedelta(hours=diff_to_utc)
#     next_one = today + datetime.timedelta(days=1)
#     next_two = today + datetime.timedelta(days=2)
#     next_three = today + datetime.timedelta(days=3)
#
#     hours_ranges = {
#         range(0, 13):
#             [
#                 template.format(today.year, today.month, today.day, today.hour),  # today
#                 template.format(today.year, today.month, today.day, 12 + diff_to_utc),  # today day
#                 template.format(next_one.year, next_one.month, next_one.day, 6 + diff_to_utc),  # next one
#                 template.format(next_one.year, next_one.month, next_one.day, 12 + diff_to_utc),  # next one day
#                 template.format(next_two.year, next_two.month, next_two.day, 6 + diff_to_utc),  # next two
#                 template.format(next_two.year, next_two.month, next_two.day, 12 + diff_to_utc),  # next two day
#                 template.format(next_three.year, next_three.month, next_three.day, 12)  # next three
#             ],
#         range(12, 25):
#             [
#                 template.format(today.year, today.month, today.day, today.hour),  # next one
#                 template.format(today.year, today.month, today.day, today.hour),  # today day
#                 template.format(next_one.year, next_one.month, next_one.day, 6 + diff_to_utc),  # next one
#                 template.format(next_one.year, next_one.month, next_one.day, 12 + diff_to_utc),  # next one day
#                 template.format(next_two.year, next_two.month, next_two.day, 6 + diff_to_utc),  # next two
#                 template.format(next_two.year, next_two.month, next_two.day, 12 + diff_to_utc),  # next two day
#                 template.format(next_three.year, next_three.month, next_three.day, 12)  # next three
#             ]
#     }
#
#     for hour_range in hours_ranges:
#         if today.hour in hour_range:
#             return hours_ranges[hour_range]
#
#
# d = get_strftime()
# from pprint import pprint
# pprint(d)