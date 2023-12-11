:- use_module(library(pldoc)).
:- use_module(library(doc_files)).
:- use_module(library(filesex)).

:- initialization(gen_doc, main).

doc_file(matrix).

load_all :-
    ensure_loaded(library(clpr)),
    forall(doc_file(File),
           ( directory_file_path('../prolog', File, Path),
             ensure_loaded(Path))).

gen_doc :-
    load_all,
    Opts = [ doc_root('.'),
             include_reexported(false)
           ],

    forall(doc_file(File),
           ( directory_file_path('../prolog', File, Path),
             doc_save(Path, Opts))).
