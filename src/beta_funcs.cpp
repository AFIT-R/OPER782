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







// [[Rcpp::depends(RcppEigen)]]
// [[Rcpp::depends(RcppNumerical)]]
//' @export
//' @rdname beta4
//' @import RcppNumerical
// [[Rcpp::export]]
// NumericVector pbeta4(NumericVector q,
//                      double min,
//                      double max,
//                      double shape1,
//                      double shape2,
//                      double gap = 0.000001) {
//
//   double MIN = which_min(q);
//   double MAX = which_max(q);
//
//   bool test1 = q[MIN] < min ;
//
//   if(test1==TRUE) {
//     stop("Values in q cannot be smaller than min");
//   }
//
//   bool test2 = q[MAX] > max ;
//
//   if(test2==TRUE) {
//     stop("Values in q cannot be greater than max");
//   }
//
//   bool test3 = q[MIN] == min ;
//
//   if(test3==TRUE) { q[MIN] = q[MIN] + gap; }
//
//   bool test4 = q[MAX] == max ;
//
//   if(test4==TRUE) { q[MAX] = q[MAX] - gap; }
//
//   NumericVector numer = pow((x - min), (shape1 - 1)) * pow((max - x), (shape2 - 1));
//   double denom = pow((max - min), (shape1 + shape2 - 1));
//   double beta  = boost::math::beta(shape1, shape2) ;
//
//   return numer / (denom * beta) ;
// }
