##get index for each position
k.ix <- which(x2[,'pos']=='k')
qb.ix <- which(x2[,'pos']=='qb')
rb.ix <- which(x2[,'pos']=='rb')
te.ix <- which(x2[,'pos']=='te')
wr.ix <- which(x2[,'pos']=='wr')

#################################################################################
# I made a named list of all of your indexes ^ ##################################
#################################################################################
all_ix <- list("qb" = qb_ix, "rb" = rb_ix, "wr" = wr_ix, "te" = te_ix, "k" = k_ix)

for (p in names(posReq)) {
  ix <- all_ix[[p]] # Lists need double brackets [[]] to access vector elements 
  if (posReq[p] > 0) {
    x2[ix, 'marg'] <- proj_20_order[ix,'points'] - x2[ix[posReq[p]*nTeams],'points']
  } else {
    x2[ix, 'marg'] <- -1 # You had this as 0, but if you make it 0 then these players get kept when you filter below
  }
}
