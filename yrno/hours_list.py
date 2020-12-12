# import datetime
#
#
# def get_parsed_time(diff_to_utc: int = -3):
#     template = '{}-{:0>2}-{:0>2}T{:0>2}:00:00Z'
#     today = datetime.datetime.now() + datetime.timedelta(hours=diff_to_utc)
#     next_one = today + datetime.timedelta(days=1)
#     next_two = today + datetime.timedelta(days=2)
#     next_three = today + datetime.timedelta(days=3)
#
#     times = {
#         range(0, 13):
#             [
#                 template.format(today.year, today.month, today.day, today.hour),  # next one
#                 template.format(today.year, today.month, today.day, 12 + diff_to_utc),  # today day
#                 template.format(next_one.year, next_one.month, next_one.day, 6 + diff_to_utc),  # next one
#                 template.format(next_one.year, next_one.month, next_one.day, 12 + diff_to_utc),  # next one day
#                 template.format(next_two.year, next_two.month, next_two.day, 6 + diff_to_utc),  # next two
#                 template.format(next_two.year, next_two.month, next_two.day, 12 + diff_to_utc),  # next two day
#                 template.format(next_three.year, next_three.month, next_three.day, 12)  # next three
#             ],
#         range(12, 19):
#             [
#                 template.format(today.year, today.month, today.day, today.hour),
#                 template.format(today.year, today.month, today.day, today.hour),  # next one
#                 template.format(next_one.year, next_one.month, next_one.day, 6 + diff_to_utc),  # next one
#                 template.format(next_one.year, next_one.month, next_one.day, 12 + diff_to_utc),  # next one day
#                 template.format(next_two.year, next_two.month, next_two.day, 6 + diff_to_utc),  # next two
#                 template.format(next_two.year, next_two.month, next_two.day, 12 + diff_to_utc),  # next two day
#                 template.format(next_three.year, next_three.month, next_three.day, 12)  # next three
#             ],
#         range(18, 25):
#             [
#                 template.format(today.year, today.month, today.day, today.hour),  # next one (no next one day)
#                 template.format(next_one.year, next_one.month, next_one.day, 6 + diff_to_utc),  # next one
#                 template.format(next_one.year, next_one.month, next_one.day, 12 + diff_to_utc),  # next one day
#                 template.format(next_two.year, next_two.month, next_two.day, 6 + diff_to_utc),  # next two
#                 template.format(next_two.year, next_two.month, next_two.day, 12 + diff_to_utc),  # next two day
#                 template.format(next_three.year, next_three.month, next_three.day, 12)  # next three
#             ]
#     }
#
#     for period in times:
#         if today.hour in period:
#             return times[period]
#
