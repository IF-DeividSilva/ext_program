# pip install dash
# pip install pandas

from dash import html, dcc
import dash
from dash.dependencies import Input, Output
import pandas as pd
import plotly.express as px

from app import *
from components import sidebar, dashboards, extratos

# Layout 
#----------------------------------------------------------------

contant = html.Div(id= "page-contant")

app.layout = dbc.Container(children=[
        dbc.Row([
            dbc.Col([
                dcc.location(id='url'),
                sidebar.layout 
            ], md=2),    # coluna ocupa 2 espacos de 12 
            dbc.Col([
                content
            ], md = 10),  # coluna ocupa 10 espacos de 12
    ])


], fluid=True) # conteudo da pagina vai se espalhar pela tela toda

#----------------------------------------------------------------

# Callbacks 
@app.callback(
    Output('page-content', 'children'),
    [Input('url', 'pathname')]
)

 # função que renderiza a página a partir do pathname (rota) escolhida
def render_page(pathname):
    if pathname == '/' or pathname == '/dashboards':
        return dashboards.layout
    if pathname == '/extratos':
        return extratos.layout
 

if __name__ == "__main__":
    app.run_server(port=8051, debug=True) # rodar o servidor na porta 8051 e com debug ativado (para atualizar automatic)

#----------------------------------------------------------------