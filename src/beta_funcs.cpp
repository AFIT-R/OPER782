// [[Rcpp::depends(BH)]]

#include <Rcpp.h>
#include <boost/math/special_functions/beta.hpp>

using namespace Rcpp;
using namespace boost::math;

// [[Rcpp::export]]
List scaled_betaPDF(NumericVector y,
                             double low,
                             double high,
                             double shape1,
                             double shape2) {
  NumericVector numer = pow((y - low), (shape1 - 1)) * pow((high - y), (shape2 - 1));
  NumericVector denom = pow((high - low), (shape1 + shape2 - 1));
  NumericVector beta  = boost::math::beta(shape1, shape2) ;

  List z = List::create(numer, denom, beta) ;

  return z;
}


// You can include R code blocks in C++ files processed with sourceCpp
// (useful for testing and development). The R code will be automatically
// run after the compilation.
//

/*** R
scaled_betaPDF(c(0.0001,0.5,.9999), low = 0, high = 1, shape1 = 0.5, shape2 = 0.5)
*/
