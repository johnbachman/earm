import scipy.optimize.anneal
import numpy
import pysb.anneal_sundials
from earm_1_5biomods import model
envlist, paramarr = pysb.anneal_sundials.annlinit(model)
xpfile = numpy.load('xp_mod_data_earm10.npz')
xpdata = xpfile['arr_0']

prmfile = numpy.load('earm_1_5smacannlst.npz')
smacprm = prmfile['arr_0']
smacnum = prmfile['arr_1']
smaclst = prmfile['arr_2']

lb, ub, lower, upper = pysb.anneal_sundials.getgenparambounds(smacprm, omag=3, N=1000)

annlout = scipy.optimize.anneal(pysb.anneal_sundials.annealfxn, smacprm, args=(smacnum, 25000, model, envlist, xpdata, 6, 3, lb, ub), lower=lower, upper=upper, full_output=1)
#started at 1:56a






#===
bidlist = ['kbidCbidMf','kbidCbidMr','kbidbcl2f','kbidbcl2r','kc8bidf','kc8bidr','kc8bidc']
bidnums = []
bidparms = []
for i in range(len(bidlist)):
    for j in range(len(model.parameters)):
        if bidlist[i] == model.parameters[j].name:
            bidparms.append(model.parameters[j].value)
            bidnums.append(j)
annprm = numpy.asarray(bidparms)
annnum = numpy.asarray(bidnums)
#==
annlout = scipy.optimize.anneal(pysb.anneal_sundials.annealfxn, smacprm, args=(smacnum, 16000, model, envlist, xpdata, , , lb, ub), lower=lower, upper=upper)

#==
(array([  6.79340822e-03,   1.12124596e-02,   2.09963730e-02,
         1.05987115e-03,   8.20877410e-04,   1.34149964e-02,
         1.10654467e-08,   1.22858382e-04,   1.79347065e+00,
         2.36563475e-07,   1.48074106e-03,   5.46199964e-01,
         1.81273169e-05,   2.46031198e-03,   1.20592832e-04,
         4.63718851e-04,   1.20397286e-04,   9.64010016e-04,
         2.09413388e-05,   1.79095428e-03,   1.56062421e-04,
         3.79709718e-06,   8.94941511e-05,   8.00660060e-04,
         4.14904703e-04,   1.22996266e-03,   2.66372097e-06,
         1.08491891e-03,   1.36705667e-04,   3.90635514e-04,
         1.28796818e-04,   1.53904992e-02,   3.65335520e-06,
         1.09338669e-03,   6.06644682e-05,   3.02374608e-04,
         1.70465198e-05,   1.63837876e-03,   7.51425123e-06,
         6.54436113e-05,   2.10406009e-06,   4.91115449e-03,
         1.96341396e+00,   1.15459381e-05,   1.26191198e-03,
         1.01643524e+01,   5.54825826e-05,   1.85324496e-03,
         1.17172716e+01,   7.93018037e-06,   3.22387529e-03,
         2.79628535e+01,   3.24882191e-06,   2.20641219e-03,
         1.29726190e-02,   1.23336350e-02,   3.18864633e-02,
         1.72639432e-02]),
 175.33586966273259,
 9.040065667844836e-13,
 4451,
 88,
 430,
 1)

array(['kbaxCbaxMf', 'kbaxCbaxMr', 'kbcl2Cbcl2Mf', 'kbcl2Cbcl2Mr',
       'kbclxlCbclxlMf', 'kbclxlCbclxlMr', 'kbidbaxf', 'kbidbaxr',
       'kbidbaxc', 'kbidbakf', 'kbidbakr', 'kbidbakc', 'kbaxdimf',
       'kbaxdimr', 'kbaxtrimf', 'kbaxtrimr', 'kbaxtetf', 'kbaxtetr',
       'kbakdimf', 'kbakdimr', 'kbaktrimf', 'kbaktrimr', 'kbaktetf',
       'kbaktetr', 'baxbcl2f', 'baxbcl2r', 'baxbclxlf', 'baxbclxlr',
       'bakbclxlf', 'bakbclxlr', 'bakmcl1f', 'bakmcl1r', 'kbadbcl2f',
       'kbadbcl2r', 'kbadbclxlf', 'kbadbclxlr', 'knoxabcl2f', 'knoxabcl2r',
       'knoxamcl1f', 'knoxamcl1r', 'kbaxcytocMCf', 'kbaxcytocMCr',
       'kbaxcytocMCc', 'kbaxsmacCAf', 'kbaxsmacCAr', 'kbaxsmacCAc',
       'kbakcytocMCf', 'kbakcytocMCr', 'kbakcytocMCc', 'kbaksmacCAf',
       'kbaksmacCAr', 'kbaksmacCAc', 'ksmacxiapf', 'ksmacxiapr',
       'kcytocCcytoAf', 'kcytocCcytoAr', 'ksmacCsmacAf', 'ksmacCsmacAr'], 
      dtype='|S14')
