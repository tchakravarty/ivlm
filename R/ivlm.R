#====================================================================
# purpose: reimplement the procedures in the ivreg2 for R
# author: tirthankar chakravarty
# created: 8th december 2013
# revised:
<<<<<<< HEAD
# dependencies: Rcpp, methods, 
# comments: Right now the file is a whole lot of scaffolding and not 
#   whole lot of code.
=======
# dependencies: Rcpp, testthat, 
# comments:
>>>>>>> f47a3d337f92657f51dae982391218bea70b3d2a
#====================================================================

rm(list = ls())

#==========================================================
# implement the linear regression as a reference class
#   with all the generic functions that you expect to include
#   eventually:
#   a. print
#   b. plot
#   c. summary
#   d. what are the post estimation commands that you
#     expect to work out of the box?
#==========================================================
ivlmClass = setRefClass('ivlmClass',
                        # what are the fields that the ivlmClass
                        #   object will contain
                        fields = list(data = 'list',
                                      ),
                        # what are the methods that can act on
                        #   an object of class ivlmClass
                        methods = list(fnThatDoesNothing = function() {
                          # apparently all edits need to be made using 
                          #   the annoying global assign
                        }),
                        )

# DISCUSS what is OOP without inheritance? reference classes easily pass
#   inheritance, and so the right way to design this would be to have a 
#   base class that contains all the methods that I want to have in the
#   IV estimator and testing classes and then, override them in the 
#   individual classes.

