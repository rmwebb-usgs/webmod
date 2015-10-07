ptf %
# Par2par file for PRMS parameter estimation
* parameter data
CO2uz =  %    CO2uz     %
CO2str = %    CO2str    %
O2uz =   %    O2uz      %
O2str =  %    O2str     %
koligu = %    koligu    %
kbiotu = %    kbiotu    %
kchlru = %    kchlru    %
kcalcu = %    kcalcu    %
kpyr_u = %    kpyr_u    %
ksmecu = %    ksmecu    %
knitru = %    knitru    %
koligs = %    koligs    %
kbiots = %    kbiots    %
kchlrs = %    kchlrs    %
kcalcs = %    kcalcs    %
kpyr_s = %    kpyr_s    %
ksmecs = %    ksmecs    %
knitrs = %    knitrs    %
kK_sum = %    kK_sum    %
kK_win = %    kK_win    %
todays = %    todays    %
tudays = %    tudays    %
tsdays = %    tsdays    %
tocadj = %    tocadj    %
tucadj = %    tucadj    %
tscadj = %    tscadj    %
qdffrac = %    qdffrac   %
td     = %    td        %
adjmix = %    adjmix    %
candep = %    candep    %
ccvint = %    ccvint    %
ccvslp = %    ccvslp    %
chloss = %    chloss    %
chvelo = %    chvelo    %
cdensm = %    cdensm    %
cdenwn = %    cdenwn    %
crdcof = %    crdcof    %
crddexp = %    crddexp   %
daymlt = %    daymlt    %
pancof = %    pancof    %
gwloss = %    gwloss    %
hamcof = %    hamcof    %
isofac = %    isofac    %
meltba = %    meltba    %
meltmx = %    meltmx    %
meltra = %    meltra    %
nmeltf = %    nmeltf    %
pklwhc = %    pklwhc    %
pmacst = %    pmacst    %
pmacro = %    pmacro    %
pptrad = %    pptrad    %
radjsp = %    radjsp    %
radjwp = %    radjwp    %
radmax = %    radmax    %
rainad = %    rainad    %
s_ohor = %    s_ohor    %
s_thpo = %    s_thpo    %
s_thfc = %    s_thfc    %
awc    = %    awc       %
s_rock = %    s_rock    %
s_root = %    s_root    %
s_satk = %    s_satk    %
s_zmax = %    s_zmax    %
s_zmin = %    s_zmin    %
sn_thr = %    sn_thr    %
sn_adj = %    sn_adj    %
sn_int = %    sn_int    %
sn_ion = %    sn_ion    %
sO_dpl = %    sO_dpl    %
sD_dpl = %    sD_dpl    %
sraini = %    sraini    %
wraini = %    wraini    %
recess = %    recess    %
sn_flx = %    sn_flx    %
tmxadj = %    tmxadj    %
tmxalr = %    tmxalr    %
tmxals = %    tmxals    %
tmnadj = %    tmnadj    %
trdegc = %    trdegc    %
windad = %    windad    %
xkcvar = %    xkcvar    %
xkvert = %    xkvert    %

# T_decay = 0, original exponential decay, T0 (transm) not constrained by szm (shape factor)
#transm  =  recess
# T_decay = 1, parabolic decay
transm  =  (recess*8.12775)**2
# T_decay = 2, linear decay
#transm  =  recess*92.72550721

meltmn = meltmx * meltra
s_thwp = s_thfc-awc

* template files
webmod.params.tpl webmod.params
webmod.pqi.tpl webmod.pqi
