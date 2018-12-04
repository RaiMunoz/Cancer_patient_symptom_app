# X get mysql connection
# X get table data
# get rows/hr
# get get aggregate data/hr

# walkin
# stationary

from datetime import datetime

import mysql.connector
import plotly.graph_objs as go
import plotly.plotly as py

config = {
    'user': 'root',
    'password': 'root',
    'host': '127.0.0.1',
    'database': 'c4g',
    'raise_on_warnings': True
}

cnx = mysql.connector.connect(**config)

cur = cnx.cursor()


def get_init_timestamp(cur):
    # Use all the SQL you like
    cur.execute("SELECT * FROM `plugin_ios_activity_recognition` ORDER BY _id ASC LIMIT 1")

    # print all the first cell of all the rows
    for row in cur.fetchall():
        return row[1]


def get_last_timestamp(cur):
    # Use all the SQL you like
    cur.execute("SELECT * FROM `plugin_ios_activity_recognition` ORDER BY _id DESC LIMIT 1")

    # print all the first cell of all the rows
    for row in cur.fetchall():
        return row[1]


def get_hour(time_data):
    data = datetime.fromtimestamp(time_data / 1000)
    return data.hour


def get_hour_data(cur, start_time, end_time):
    WHERE = "WHERE timestamp>%f AND timestamp<%s" % (start_time, end_time)
    cur.execute("SELECT COUNT(*) FROM `plugin_ios_activity_recognition` " + WHERE + "")

    # print all the first cell of all the rows
    for row in cur.fetchall():
        total = row[0]

    cur.execute("SELECT COUNT(*) FROM `plugin_ios_activity_recognition` " + WHERE + " AND stationary=1")

    # print all the first cell of all the rows
    for row in cur.fetchall():
        stationary = row[0]

    cur.execute("SELECT COUNT(*) FROM `plugin_ios_activity_recognition` " + WHERE + " AND walking=1 OR running =1")

    # print all the first cell of all the rows
    for row in cur.fetchall():
        walking = row[0]

    print total, "walking", walking, "stationary", stationary

    ACTIVITIES['total'].append(total)
    ACTIVITIES['walking'].append(walking)
    ACTIVITIES['stationary'].append(stationary)


INIT_TIME = get_init_timestamp(cur)
LAST_TIME = get_last_timestamp(cur)

LOOP_TIME = INIT_TIME
print INIT_TIME, LAST_TIME, LOOP_TIME
TIMES = []
STATIONARY = []
WALKING = []
ACTIVITIES = {"total": [], "walking": [], "stationary": [], "running": [], "automotive": []}
DAY = 0
while LOOP_TIME < LAST_TIME:
    END_LOOP = LOOP_TIME + (3600 * 1000)
    hour = get_hour(LOOP_TIME)
    if DAY == 1:
        get_hour_data(cur, LOOP_TIME, END_LOOP)
        TIMES.append(hour)
    LOOP_TIME = END_LOOP

    if hour == 0:
        DAY += 1

# get_hour(INIT_TIME)


cnx.close()
py.sign_in('vkamath', 'f9LEGXLIKsuZiOkxBqlU')

trace1 = go.Bar(
    x=TIMES,
    y=ACTIVITIES['walking'],
    name='Walking'
)
trace2 = go.Bar(
    x=TIMES,
    y=ACTIVITIES['stationary'],
    name='Stationary'
)

data = [trace1, trace2]
layout = go.Layout(
    xaxis=dict(tickangle=-45),
    barmode='stack'
)

fig = go.Figure(data=data, layout=layout)
py.plot(fig, filename='stacked-bar')
