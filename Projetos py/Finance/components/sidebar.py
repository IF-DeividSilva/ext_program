
import os
import dash
import json
import plotly.express as px
from dash import html, dcc
from dash.dependencies import Input, Output, State
import dash_bootstrap_components as dbc

from app import app
from datetime import datetime, date

import pdb
from dash_bootstrap_templates import ThemeChangerAIO




# layout
#--------------------------------------------------------------
layout = dbc.Col([
        html.H1("Financas Pessoais", className="text-primary"), # titulo 
        html.P("Por Deivid da Silva Galvão", className="text-info"), # subtitulo (.P -> paragraph)
        html.Hr(), # quebra de linha

    # Botoes de Nova Receita e Nova Despesa
    #--------------------------------------------------------------
        dbc.Row([
            dbc.Col([
                dbc.Button(color="blue", id='open-novo-receita',
                    children=['Nova Receita'])
            ], width=6),

            dbc.Col([
                dbc.Button(color="red", id='open-novo-despesa',
                    children=['Nova Despesa'])
            ], width=6)
    ]),
    #--------------------------------------------------------------


    # Botoes de navegação
    #--------------------------------------------------------------
        dbc.Nav([
            dbc.NavLink("Dashboards", href="/dashboards", active='exact'),
            dbc.NavLink("Extratos", href="/extratos", active='exact'),

        ], vertical=True, pills=True, id = 'nav_buttons', style={'margin-top': '50px'})  # margin-button
    #--------------------------------------------------------------
    
], id='sidebar_completa')