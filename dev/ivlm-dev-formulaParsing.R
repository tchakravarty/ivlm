#====================================================================
# purpose: working with R reference classes and formulae
# 
#====================================================================

linRegClass = setRefClass('linRegClass',
                          fields = list(formulaIV = 'formula',
                                        data = 'data.frame'),
                          methods = list(doReg = function() {
                            lm(.self$formulaIV, data = .self$data)
                          }))

a = linRegClass$new(data = cars, 
                    formulaIV = as.formula(speed ~ dist))
a$doReg()

#==========================================================
# create a user interface for the class
# DISCUSS What is the point of writing a class and then 
#   adding a functional interface to the class?
#   Does this have to do with my lack of understanding of the
#   the modify-on-change semantics?
#==========================================================
ivlm = function(formulaIV, data) {
  a = linRegClass$new(formulaIV = formulaIV, data = data)
  a$doReg()
}

b = ivlm(data = cars, 
     formulaIV = as.formula(speed ~ dist))

setMethod('show', 'linRegClass', function(object) {
  cat('class: ', class(object), '\n')
  cat('Call: ', deparse(object$formulaIV), '\n')
}) 
show(linRegClass$new(data = cars, 
      formulaIV = as.formula(speed ~ dist)))

setMethod('show', 'linRegClass', function() {
  print('Gobbledy Gook!!')
})

setMethod('cummax', 'linRegClass', function() {
  print('Gobbledy Gook!!')
})

as.character(speed ~ dist)
deparse(speed ~ dist)

# NOTE 1. Why have we been able to add a show method to the linRegClass
#   even though we did not explicitly set it as a generic method?
#   What then is the role of a setGeneric against a reference class?
#   2. There are no private data members, so those that are intended
#   as private members (those that the user should not be able to 
#   change are prepended by a '.')

#==========================================================
# handling more complex formulae
# NOTE this is where we will need to look at some of the packages
#   that handle complex formulae objects; like lme4, 
#==========================================================
terms.formula(as.formula(speed ~ dist | somethingElse))


