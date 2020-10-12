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
