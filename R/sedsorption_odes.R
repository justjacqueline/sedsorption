#
# # Model structure
#
# ## Parameter names & Equations
#
# ### Change in mass over time (mg/hr)
# - dDS = change in Dismal Swamp DOC mass in solution over time
# - dLT = change in wetland CDOC mass in solution over time
# - dNC = change in wetland NCDOC mass in solution over time
# ### Rate parameters (hr-1)
# - kdDS, kdLT, kdNC = desorption rate
# - kaDS, kaLT, kaNC = adsorption rate
# ### State Variables (mg)
# - DSs, LTs, NCs = sediment Dismal Swamp DOC, wetland CDOC, and wetland NCDOC mass
# - DSw, LTw, NCw = water Dismal Swamp DOC, wetland CDOC, and wetland NCDOC mass
# ### First order ODEs
# - dDSw <- kdDS * DSs - kaDS * DSw #del mass of GDS DOC in solution
# - dLTw <- kdLT * LTs - kaLT * LTw #del mass of sediment CDOC in solution -- colored
# - dNCw <- kdNC * NCs - kaNC * NCw #del mass of sediment NCDOC in solution -- non-colored
# - dDSs <- kaDS * DSw - kdDS * DSs #del mass of GDS DOC on sediment
# - dLTs <- kaLT * LTw - kdLT * LTs #del mass of sediment CDOC on sediment -- colored
# - dNCs <- kaNC * NCw - kdNC * NCs #del mass of sediment NCDOC on sediment -- non-colored
# - change in mass over time is equal to the addition from desorption and loss via adsorption at every time step
# ### ID names
# - JB__ or TA__ = kinetic experiments
# - JB = Jug Bay
# - TA = Taskinas
# - W___ or P___ = spatial kinetic experiments
# - W = shallow, P = deep
# - C = creek edge, I = intermediate site, M = high marsh
# - __HF, __HS, __LF, __LS = scenario
# - HF = High initial [DOC], Fresh
# - HS = High initial [DOC], Saline
# - LF = Low initial [DOC], Fresh
# - LS = Low initial [DOC], Saline
# - 1-7 = time points
# - 1 = 0 min, 2 = 10 min, 3 = 15 min, 4 = 1 hr, 5 = 6 hr, 6 = 12 hr, 7 = 24 hr


threecomp <- function (time, y, parms, ...) {
  with(as.list(c(parms, y)), {
    dDSw <- kdDS*DSs - kaDS*DSw
    dLTw <- kdLT*LTs - kaLT*LTw
    dNCw <- kdNC*NCs - kaNC*NCw
    dDSs <- kaDS*DSw - kdDS*DSs
    dLTs <- kaLT*LTw - kdLT*LTs
    dNCs <- kaNC*NCw - kdNC*NCs
    list(c(dDSw, dLTw, dNCw, dDSs, dLTs, dNCs))})}

twocomp <- function (time, y, parms, ...) {
  with(as.list(c(parms, y)), {
    dDSw <- kdDS*DSs - kaDS*DSw
    dNCw <- kdNC*NCs - kaNC*NCw
    dDSs <- kaDS*DSw - kdDS*DSs
    dNCs <- kaNC*NCw - kdNC*NCs
    list(c(dDSw, dNCw, dDSs, dNCs))})}
