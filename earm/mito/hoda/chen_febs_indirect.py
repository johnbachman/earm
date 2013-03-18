"""
Model M11b: "Indirect" MOMP model from [Chen2007febs]_.
"""

from pysb import *
from earm import shen_modules
from hoda_ize import *

Model()

shen_modules.momp_monomers()

# Hoda modifications --
shen_modules.chen_febs_indirect(do_pore_transport=True, do_pore_assembly=True)
add_caspase8(model)
update_bid_initial_condition(model)
Observable('cSmac_', Smac(state='C'))
# --

# Observables
Observable('Bax4_', MatchOnce(Bax(bf=None, s1=1, s2=4) %
                              Bax(bf=None, s1=2, s2=1) %
                              Bax(bf=None, s1=3, s2=2) %
                              Bax(bf=None, s1=4, s2=3)))
Observable('Bid_', Bid(bf=None))
Observable('Bcl2_', Bcl2(bf=None))
Observable('Bcl2_Bid_', Bcl2(bf=1) % Bid(bf=1))
Observable('Bcl2_Bax_', Bcl2(bf=1) % Bax(bf=1))

