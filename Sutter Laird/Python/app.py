import dash
from dash.dependencies import Input, Output
import dash_html_components as html
import dash_core_components as dcc
import plotly.graph_objects as go
import dash_table
import pandas as pd
import plotly.graph_objects as go

external_stylesheets = ['https://codepen.io/chriddyp/pen/bWLwgP.css']
df = pd.read_csv('countries_conf0.csv')


app = dash.Dash(__name__, external_stylesheets=external_stylesheets)
app.title="Capstone"

app.layout = html.Div([
    html.H1('Using Big Data to Analyze China\'s Media and Foreign Affairs'),
    dcc.Tabs(id="nav-tabs", value='about', children=[
        dcc.Tab(label='About', value='about'),
        dcc.Tab(label='Chinese Tone', value='chinesetone'),
        dcc.Tab(label='Local Tone', value='localtone'),
        dcc.Tab(label='Western Tone', value='westerntone'),
        dcc.Tab(label='Chinese-Western Difference', value='chinesewesterndifference'),
        dcc.Tab(label='Chinese-Local Difference', value='chineselocaldifference'),
        dcc.Tab(label='Western-Local Difference', value='westernlocaldifference'),
        dcc.Tab(label='Ratio', value='ratio'),
    ]),
    html.Div(id='nav-tabs-content')
])





@app.callback(Output('nav-tabs-content', 'children'),
              [Input('nav-tabs', 'value')])
def render_content(tab):
    # Change hoverInfoValue to determine if data should be shown when hovering over a country
    hoverInfoValue = "location + text"
    # manualColorScale = [[0, 'rgb(255,255,0)'], [1, 'rgb(255,165,0)']]
    manualColorScale = "blues"
    fixedZMin = -6
    fixedZMax = 6
    fixedZauto = True


    if tab == "about":
        return html.Div(
            children=[
                html.H3("About")
            ]
        )

    



    if tab == "chinesetone":
        fig = go.Figure(
            data=go.Choropleth(
                locations = df['Code'],
                hoverinfo=hoverInfoValue,
                z = df['Chinese Tone'],
                zauto = fixedZauto,
                zmin = fixedZMin,
                zmax = fixedZMax,
                text = df['Country'],
                colorscale = manualColorScale,
                autocolorscale=False,
                reversescale=False,
                marker_line_color='darkgray',
                marker_line_width=0.5,
                colorbar_tickprefix = '',
                colorbar_title = 'Mean Tone',
        ))

        fig.update_layout(
            autosize=True,
            margin=go.layout.Margin(
                l=0,
                r=0,
                b=0,
                t=50,
                pad=0
            ),
            title_text='Heatmap of Chinese Media Tone by Country',
            geo=dict(
                showframe=False,
                showcoastlines=False,
                projection_type='equirectangular'
            )
        )





    elif tab == "localtone":
        fig = go.Figure(
            data=go.Choropleth(
                locations = df['Code'],
                hoverinfo=hoverInfoValue,
                z = df['Local Tone'],
                zauto = fixedZauto,
                zmin = fixedZMin,
                zmax = fixedZMax,
                text = df['Country'],
                colorscale = manualColorScale,
                autocolorscale=False,
                reversescale=False,
                marker_line_color='darkgray',
                marker_line_width=0.5,
                colorbar_tickprefix = '',
                colorbar_title = 'Mean Tone',
        ))

        fig.update_layout(
            autosize=True,
            margin=go.layout.Margin(
                l=0,
                r=0,
                b=0,
                t=50,
                pad=0
            ),
            title_text='Heatmap of Local Media Tone by Country',
            geo=dict(
                showframe=False,
                showcoastlines=False,
                projection_type='equirectangular'
            )
        )
    




    elif tab == "westerntone":
        fig = go.Figure(
            data=go.Choropleth(
                locations = df['Code'],
                hoverinfo=hoverInfoValue,
                z = df['Western Tone'],
                zauto = fixedZauto,
                zmin = fixedZMin,
                zmax = fixedZMax,
                text = df['Country'],
                colorscale = manualColorScale,
                autocolorscale=False,
                reversescale=False,
                marker_line_color='darkgray',
                marker_line_width=0.5,
                colorbar_tickprefix = '',
                colorbar_title = 'Mean Tone',
        ))

        fig.update_layout(
            autosize=True,
            margin=go.layout.Margin(
                l=0,
                r=0,
                b=0,
                t=50,
                pad=0
            ),
            title_text='Heatmap of Western Media Tone by Country',
            geo=dict(
                showframe=False,
                showcoastlines=False,
                projection_type='equirectangular'
            )
        )





    elif tab == "chinesewesterndifference":
        fig = go.Figure(
            data=go.Choropleth(
                locations = df['Code'],
                hoverinfo=hoverInfoValue,
                z = df['Chinese-Western'],
                zauto = fixedZauto,
                zmin = fixedZMin,
                zmax = fixedZMax,
                text = df['Country'],
                colorscale = manualColorScale,
                autocolorscale=False,
                reversescale=False,
                marker_line_color='darkgray',
                marker_line_width=0.5,
                colorbar_tickprefix = '',
                colorbar_title = 'Difference',
        ))

        fig.update_layout(
            autosize=True,
            margin=go.layout.Margin(
                l=0,
                r=0,
                b=0,
                t=50,
                pad=0
            ),
            title_text='Heatmap of Difference Between Chinese and Western Media Tone by Country',
            geo=dict(
                showframe=False,
                showcoastlines=False,
                projection_type='equirectangular'
            )
        )





    elif tab == "chineselocaldifference":
        fig = go.Figure(
            data=go.Choropleth(
                locations = df['Code'],
                hoverinfo=hoverInfoValue,
                z = df['Chinese-Local'],
                zauto = fixedZauto,
                zmin = fixedZMin,
                zmax = fixedZMax,
                text = df['Country'],
                colorscale = manualColorScale,
                autocolorscale=False,
                reversescale=False,
                marker_line_color='darkgray',
                marker_line_width=0.5,
                colorbar_tickprefix = '',
                colorbar_title = 'Difference',
        ))

        fig.update_layout(
            autosize=True,
            margin=go.layout.Margin(
                l=0,
                r=0,
                b=0,
                t=50,
                pad=0
            ),
            title_text='Heatmap of Difference Between Chinese and Local Media Tone by Country',
            geo=dict(
                showframe=False,
                showcoastlines=False,
                projection_type='equirectangular'
            )
        )





    elif tab == "westernlocaldifference":
        fig = go.Figure(
            data=go.Choropleth(
                locations = df['Code'],
                hoverinfo=hoverInfoValue,
                z = df['Western-Local'],
                zauto = fixedZauto,
                zmin = fixedZMin,
                zmax = fixedZMax,
                text = df['Country'],
                colorscale = manualColorScale,
                autocolorscale=False,
                reversescale=False,
                marker_line_color='darkgray',
                marker_line_width=0.5,
                colorbar_tickprefix = '',
                colorbar_title = 'Difference',
        ))

        fig.update_layout(
            autosize=True,
            margin=go.layout.Margin(
                l=0,
                r=0,
                b=0,
                t=50,
                pad=0
            ),
            title_text='Heatmap of Difference Between Western and Local Media Tone by Country',
            geo=dict(
                showframe=False,
                showcoastlines=False,
                projection_type='equirectangular'
            )
        )





    elif tab == "ratio":
        fig = go.Figure(
            data=go.Choropleth(
                locations = df['Code'],
                hoverinfo=hoverInfoValue,
                z = df['Ratio'],
                zauto = fixedZauto,
                zmin = fixedZMin,
                zmax = fixedZMax,
                text = df['Country'],
                colorscale = manualColorScale,
                autocolorscale=False,
                reversescale=False,
                marker_line_color='darkgray',
                marker_line_width=0.5,
                colorbar_tickprefix = '',
                colorbar_title = 'Ratio',
        ))

        fig.update_layout(
            autosize=True,
            margin=go.layout.Margin(
                l=0,
                r=0,
                b=0,
                t=50,
                pad=0
            ),
            title_text='Heatmap of Ratio Between Chinese/Local Difference and Western/Local Difference',
            geo=dict(
                showframe=False,
                showcoastlines=False,
                projection_type='equirectangular'
            )
        )
        

    return html.Div(
        children=dcc.Graph(
            figure=fig
        )
    )




if __name__ == '__main__':
    app.run_server(debug=False)