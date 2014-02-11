#====================================================================
# purpose: 
#   - create an ivlm class
#   - create a couple of estimation and inference functions
#   - create a functional interface to the creation (and estimation)
#     and the inference functions
# author: tirthankar chakravarty
# created: 18th december 2013
# revised:
# dependencies:
# comments:
#====================================================================

rm(list = ls())

#==========================================================
# 1. set the class and the initialize method
#==========================================================
ivlmClass = setRefClass('ivlmClass',
                        fields = list(formulaIV = 'formula',
                                      dataIV = 'data.frame'),
                        methods = list(initialize = function() {
                          callSuper()                          
                        }))
