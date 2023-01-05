import dash
from dash.dependencies import Input, Output
import dash_html_components as html
import dash_core_components as dcc
import plotly.graph_objects as go
import dash_table
import pandas as pd
import plotly.graph_objects as go

external_stylesheets = ['https://codepen.io/chriddyp/pen/bWLwgP.css']



kenya0 = '../Kenya Tables/Kenya_table_conf0.csv'
kenya30 = '../Kenya Tables/Kenya_table_conf30.csv'
kenya50 = '../Kenya Tables/Kenya_table_conf50.csv'
kenya70 = '../Kenya Tables/Kenya_table_conf70.csv'
kenya100 = '../Kenya Tables/Kenya_table_conf100.csv'

# nigeria0 = '../../Maximillian Renga/Query Results/Nigeria Confidence Levels/Nigeria_table_0ConfidenceLevel.csv'
nigeria0 = "none"
# nigeria30 = '../../Maximillian Renga/Query Results/Nigeria Confidence Levels/Nigeria_table_30ConfidenceLevel.csv'
nigeria30 = "none"
# nigeria50 = '../../Maximillian Renga/Query Results/Nigeria Confidence Levels/Nigeria_table_50ConfidenceLevel.csv'
nigeria50 = "none"
nigeria70 = '../../Maximillian Renga/Query Results/Nigeria Confidence Levels/Nigeria_table70ConfidenceLevel.csv'
nigeria100 = '../../Maximillian Renga/Query Results/Nigeria Confidence Levels/Nigeria_table100ConfidenceLevel.csv'

phillipines0 = '../../Maximillian Renga/Query Results/Philippines Confidence Levels/Philippines_table.csv'
phillipines30 = '../../Maximillian Renga/Query Results/Philippines Confidence Levels/Philippines_Phillytable30ConfidenceNoGKG.csv'
phillipines50 = '../../Maximillian Renga/Query Results/Philippines Confidence Levels/Philippines_Phillytable50ConfidenceNoGKG.csv'
phillipines70 = '../../Maximillian Renga/Query Results/Philippines Confidence Levels/Philippines_Phillytable70ConfidenceNoGKG.csv'
phillipines100 = '../../Maximillian Renga/Query Results/Philippines Confidence Levels/Philippines_Phillytable100ConfidenceNoGKG.csv'

southAfrica0 = '../South Africa Tables/South Africa_table_conf0.csv'
southAfrica30 = '../South Africa Tables/South Africa_table_conf30.csv'
southAfrica50 = '../South Africa Tables/South Africa_table_conf50.csv'
southAfrica70 = '../South Africa Tables/South Africa_table_conf70.csv'
southAfrica100 = '../South Africa Tables/South Africa_table_conf100.csv'

zimbabwe0 = '../Zimbabwe Tables/Zimbabwe_table_conf0.csv'
zimbabwe30 = '../Zimbabwe Tables/Zimbabwe_table_conf30.csv'
zimbabwe50 = '../Zimbabwe Tables/Zimbabwe_table_conf50.csv'
zimbabwe70 = '../Zimbabwe Tables/Zimbabwe_table_conf70.csv'
zimbabwe100 = '../Zimbabwe Tables/Zimbabwe_table_conf100.csv'






app = dash.Dash(__name__, external_stylesheets=external_stylesheets)
app.title="Capstone"

app.layout = html.Div([
    html.H1('Using Big Data to Analyze China\'s Media and Foreign Affairs'),
    html.Div(
        children=[
            html.P("Minimum Confidence Level:"),
            dcc.Slider(
                id='confidence-slider',
                min=0,
                max=100,
                step=None,
                marks={
                    0: '0%',
                    30: '30%',
                    50: '50%',
                    70: '70%',
                    100: '100%'
                },
                value=0
        )],
        style={'width':'50%',
                'margin-bottom':'50px',
                'margin-left':'20px',
                '-webkit-user-select':'none',
                '-khtml-user-select':'none',
                '-moz-user-select':'none',
                '-ms-user-select':'none',
                'user-select':'none'}
    ),
    dcc.Tabs(id="country-tabs", value='none', children=[
        dcc.Tab(label='Map', value='map'),
        dcc.Tab(label='Kenya', value='kenya'),
        dcc.Tab(label='Nigeria', value='nigeria'),
        dcc.Tab(label='Phillipines', value='phillipines'),
        dcc.Tab(label='South Africa', value='southAfrica'),
        dcc.Tab(label='Zimbabwe', value='zimbabwe'),
    ]),
    html.Div(id='country-tabs-content')
])





@app.callback(Output('country-tabs-content', 'children'),
              [Input('country-tabs', 'value'),
              Input('confidence-slider', 'value')])
def render_content(tab, confidenceLevel):
    if tab == "map":
        # Load the map
        df = pd.read_csv('countries_conf0.csv')

        fig = go.Figure(data=go.Choropleth(
            locations = df['Code'],
            z = df['Difference'],
            text = df['Country'],
            colorscale = 'Blues',
            autocolorscale=False,
            reversescale=False,
            marker_line_color='darkgray',
            marker_line_width=0.5,
            colorbar_tickprefix = '',
            colorbar_title = 'Tone Difference',
        ))

        fig.update_layout(
            title_text='Heatmap of Difference Between Chinese and Western Media\'s Tone',
            geo=dict(
                showframe=False,
                showcoastlines=False,
                projection_type='equirectangular'
            ),
            annotations = [dict(
                x=0.55,
                y=0.1,
                xref='paper',
                yref='paper',
                text=' ',
                showarrow = False
            )]
        )
        return html.Div(
            children=dcc.Graph(
                figure=fig
            )
        )

    elif tab != "none":
        csvFile = globals()[tab + str(confidenceLevel)]
        if csvFile != "none":
            csvFile = pd.read_csv(csvFile)
            return html.Div(
                children=[
                html.H3('Minimum Confidence Level: ' + str(confidenceLevel)),
                dash_table.DataTable(
                    data=csvFile.to_dict('records'),
                    columns=[{'id': c, 'name': c} for c in csvFile.columns],
                    style_as_list_view=True,
                    style_cell={'padding': '5px'},
                    style_header={
                        'backgroundColor': 'white',
                        'fontWeight': 'bold'
                    },
                    style_cell_conditional=[
                        {
                            'if': {'column_id': c},
                            'textAlign': 'left'
                        } for c in ['Date', 'Region']
                    ],
                )],
                style={'font-size':'1.2em'}
            )
        else:
            return html.Div([
                html.H3("Table Not Yet Generated")
            ])




if __name__ == '__main__':
    app.run_server(debug=True)