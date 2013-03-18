import pysb.tools.export_hoda
from pysb import *
from pysb.util import alias_model_components

def update_bid_initial_condition(model):
    bid_index = None
    for i, ic in enumerate(model.initial_conditions):
        if ic[1].name == 'Bid_0':
            bid_index = i

    Bid = model.all_components()['Bid']

    if bid_index is not None:
        old_ic = model.initial_conditions[bid_index]
        model.update_initial_condition_pattern(old_ic[0], Bid(bf=None, state='U'))
        old_ic[1].value = 40000
    else:
        Bid_0 = Parameter('Bid_0', 40000, _export=False)
        model.add_component(Bid_0)
        model.initial(Bid(bf=None, state='U'), Bid_0)

    return model

def add_caspase8(model):
    # Add caspase 8
    C8 = Monomer('C8', ['state', 'bf'], {'state': ['pro', 'A']}, _export=False)
    model.add_component(C8)

    Bid = model.all_components()['Bid']

    # Add caspase 8 initial condition (with placeholder value 1)
    C8_0 = Parameter('C8_0', 20000, _export=False)
    model.initial(C8(state='A', bf=None), C8_0)
    model.add_component(C8_0)

    # Add rules C8 + Bid <-> C8:Bid -> Bid + C8*
    kf = Parameter('bind_C8A_BidU_to_C8ABidU_kf', 1e-7, _export=False)
    kr = Parameter('bind_C8A_BidU_to_C8ABidU_kr', 1e-3, _export=False)
    kc = Parameter('catalyze_C8ABidU_to_C8A_BidT_kc', 1, _export=False)

    r1 = Rule('bind_C8A_BidU_to_C8ABidU',
         C8(state='A', bf=None) + Bid(state='U', bf=None) <>
         C8(state='A', bf=1) % Bid(state='U', bf=1),
         kf, kr, _export=False)

    r2 = Rule('catalyze_C8ABidU_to_C8A_BidT',
         C8(state='A', bf=1) % Bid(state='U', bf=1) >>
         C8(state='A', bf=None) + Bid(state='T', bf=None),
         kc, _export=False)

    model.add_component(kf)
    model.add_component(kr)
    model.add_component(kc)
    model.add_component(r1)
    model.add_component(r2)

