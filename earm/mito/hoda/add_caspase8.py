from pysb import *
from pysb.util import alias_model_components

def add_caspase8():
    # Add caspase 8
    Monomer('C8', ['state', 'bf'], {'state': ['pro', 'A']})

    alias_model_components()

    # Add caspase 8 initial condition (with placeholder value 1)
    Initial(C8(state='A', bf=None), Parameter('C8_0', 1))

    # Add rules C8 + Bid <-> C8:Bid -> Bid + C8*
    kf = Parameter('bind_C8A_BidU_to_C8ABidU_kf', 1e-7)
    kr = Parameter('bind_C8A_BidU_to_C8ABidU_kr', 1e-3)
    kc = Parameter('catalyze_C8ABidU_to_C8A_BidT_kc', 1)

    Rule('bind_C8A_BidU_to_C8ABidU',
         C8(state='A', bf=None) + Bid(state='U', bf=None) <>
         C8(state='A', bf=1) % Bid(state='U', bf=1),
         kf, kr)

    Rule('catalyze_C8ABidU_to_C8A_BidT',
         C8(state='A', bf=1) % Bid(state='U', bf=1) >>
         C8(state='A', bf=None) + Bid(state='T', bf=None),
         kc)

