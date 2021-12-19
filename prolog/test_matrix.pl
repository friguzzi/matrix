:- module(test_matrix,
  [test_matrix/0]).
:-use_module(library(matrix)).


test_matrix:-
  run_tests([id,diag,det,inversion,inv_tiang,mul,sum,cholesky]).

:- begin_tests(id, []).
test(id):-
  matrix_identity(4,I),
    I=[[1, 0, 0, 0], [0, 1, 0, 0], [0, 0, 1, 0], [0, 0, 0, 1]].
:- end_tests(id).


:- begin_tests(diag, []).
test(diag):-
  matrix_diagonal([1,2,3,4],M),
    M = [[1, 0, 0, 0], [0, 2, 0, 0], [0, 0, 3, 0], [0, 0, 0, 4]].

:- end_tests(diag).


:- begin_tests(det, []).
test(id):-
  determinant([[2,-1,0],[-1,2,-1],[0,-1,2]],D),
  D =:= 3.999999999999999.

:- end_tests(det).

:- begin_tests(inversion, []).

test(inversion):-
  matrix_inversion([[2,-1,0],[-1,2,-1],[0,-1,2]],L),
    L = [[0.7499999999999999, 0.5000000000000001, 0.2500000000000001], [0.5000000000000001, 1.0000000000000004, 0.5000000000000002], [0.2500000000000001, 0.5000000000000002, 0.7500000000000001]].

:- end_tests(inversion).


:- begin_tests(inv_tiang, []).

test(inv_tiang):-
  matrix_inv_triang([[2,0,0],[-1,2,0],[0,-1,2]],L),
    L = [[0.5, 0.0, 0.0], [0.25, 0.5, 0.0], [0.125, 0.25, 0.5]].

:- end_tests(inv_tiang).

:- begin_tests(mul, []).

test(mul):-
  matrix_multiply([[1,2],[3,4],[5,6]], [[1,1,1],[1,1,1]],R),
    R = [[3, 3, 3], [7, 7, 7], [11, 11, 11]].


:- end_tests(mul).

:- begin_tests(sum, []).

test(sum):-
  matrix_sum([[1,2],[3,4],[5,6]],[[1,2],[3,4],[5,6]],M),
    M = [[2, 4], [6, 8], [10, 12]].


:- end_tests(sum).

:- begin_tests(cholesky, []).

test(cholesky1):-
  cholesky_decomposition([[25, 15, -5], [15, 18,  0], [-5,  0, 11]],L),
    L = [[5.0, 0, 0], [3.0, 3.0, 0], [-1.0, 1.0, 3.0]].


test(cholesky1):-
  cholesky_decomposition([[18, 22,  54,  42],[22, 70,  86,  62],[ 54, 86, 174, 134],[ 42, 62, 134, 106]],L),
    L = [[4.242640687119285, 0, 0, 0], [5.185449728701349, 6.565905201197403, 0, 0], [12.727922061357857, 3.0460384954008553, 1.6497422479090704, 0], [9.899494936611667, 1.624553864213788, 1.8497110052313648, 1.3926212476456026]].

:- end_tests(cholesky).