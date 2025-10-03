
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
    # Modal Receitas 
        dbc.Modal([
            dbc.ModalHeader(dbc.ModalTitle("Nova Receita")),
            dbc.ModalBody(
            [
                html.Label("Data de Receita"),
                dcc.Input(id='nova_receita_data', type='date', value=date.today().strftime('%Y-%m-%d')),
                html.Label("Descrição"),
                dcc.Input(id='nova_receita_descricao', type='text'),
                html.Label("Valor"),
                dcc.Input(id='nova_receita_valor', type='number'),
            ])
    ],id='modal-novo-receita'),
    # Modal Dispesas
        dbc.Modal([
            dbc.ModalHeader(dbc.ModalTitle("Nova Despesas")),
        
         dbc.ModalBody(
            [
                html.Label("Data de Despesas"),
                dcc.Input(id='nova_despesa_data', type='date', value=date.today().strftime('%Y-%m-%d')),
                html.Label("Descrição"),
                dcc.Input(id='nova_despesa_descricao', type='text'),
                html.Label("Valor"),
                dcc.Input(id='nova_despesa_valor', type='number'),
            ])
    ], id='modal-novo-despesa'),



    # Botoes de navegação
    #--------------------------------------------------------------
        dbc.Nav([
            dbc.NavLink("Dashboards", href="/dashboards", active='exact'),
            dbc.NavLink("Extratos", href="/extratos", active='exact'),

        ], vertical=True, pills=True, id = 'nav_buttons', style={'margin-top': '50px'})  # margin-button
    #--------------------------------------------------------------
    
], id='sidebar_completa')

#--------------------------------------------------------------
# Callbacks

# Receita
#--------------------------------------------------------------
@app.callback(
    Output('modal-novo-receita', 'is_open'),
    Input('modal-novo-receita', 'n_clicks'),
    State('modal-novo-receita', 'is_open')
)

def toggle_modal(n_clicks, is_open):
    if n_clicks:
        return not is_open
    return is_open
#--------------------------------------------------------------
# Despesa

#--------------------------------------------------------------

@app.callback(
    Output('modal-nova-despesa', 'is_open'),
    Input('modal-nova-despesa', 'n_clicks'),
    State('modal-nova-despesa', 'is_open')
)   

def toggle_modal(n_clicks, is_open):
    if n_clicks:
        return not is_open
    return is_open

#--------------------------------------------------------------