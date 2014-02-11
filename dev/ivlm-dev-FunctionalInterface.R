#====================================================================
# purpose: demonstrate functional interfacing of reference class code
# author: tirthankar chakravarty
# created: 18th december 2013
# revised:
# created:
# dependencies:
# comments: http://stackoverflow.com/questions/20649973/functional-interfaces-for-reference-classes
#====================================================================

linRegClass = setRefClass('linRegClass',
                          fields = list(formulaReg = 'formula',
                                        dataReg = 'data.frame'),
                          methods = list(doReg = function() {
                            lm(.self$formulaReg, data = .self$dataReg)
                          }))

linRegInstance = linRegClass$new(dataReg = cars, 
                    formulaReg = as.formula(speed ~ dist))
linRegInstance$doReg()
class(linRegInstance)

# user interface for the linear regression class
fnLinReg = function(formulaReg, dataReg) {
  linRegInstance = linRegClass$new(formulaReg = formulaReg, 
                                   dataReg = dataReg)
  linRegInstance$doReg()
}

## use the functional interface
fnLinReg(dataReg = cars, formulaReg = as.formula(speed ~ dist))

fnLinReg2 = function(formulaReg, dataReg) {
  lm(formula = formulaReg, data = dataReg)
}

## use the pure function
fnLinReg2(dataReg = cars, formulaReg = as.formula(speed ~ dist))

