"""
Model M1b: "Embedded together" model of MOMP.
"""

from pysb import *
from earm import lopez_modules
from earm import albeck_modules
from add_caspase8 import add_caspase8

Model()

lopez_modules.momp_monomers()

Observable('mBid', Bax(state='M'))
Observable('aBax', Bax(state='A'))
Observable('cSmac', Smac(state='C'))

# The specific MOMP model to use
lopez_modules.embedded()

# Add upstream caspase reactions
# ==============================
add_caspase8()


