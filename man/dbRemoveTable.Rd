% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/DBConnection.R
\name{dbRemoveTable}
\alias{dbRemoveTable}
\title{Remove a table from the database}
\usage{
dbRemoveTable(conn, name, ...)
}
\arguments{
\item{conn}{A \linkS4class{DBIConnection} object, as returned by
\code{\link[=dbConnect]{dbConnect()}}.}

\item{name}{A character string specifying a DBMS table name.}

\item{...}{Other parameters passed on to methods.}
}
\value{
\code{dbRemoveTable()} returns \code{TRUE}, invisibly.
If the table does not exist, an error is raised.
An attempt to remove a view with this function may result in an error.

An error is raised when calling this method for a closed
or invalid connection.
An error is also raised
if \code{name} cannot be processed with \code{\link[=dbQuoteIdentifier]{dbQuoteIdentifier()}}
or if this results in a non-scalar.
}
\description{
Remove a remote table (e.g., created by \code{\link[=dbWriteTable]{dbWriteTable()}})
from the database.

\Sexpr[results=rd,stage=render]{DBI:::methods_as_rd("dbRemoveTable")}
}
\section{Additional arguments}{


The following arguments are not part of the \code{dbRemoveTable()} generic
(to improve compatibility across backends)
but are part of the DBI specification:
\itemize{
\item \code{temporary} (default: \code{FALSE})
\item \code{fail_if_missing} (default: \code{TRUE})
}

These arguments must be provided as named arguments.

If \code{temporary} is \code{TRUE}, the call to \code{dbRemoveTable()}
will consider only temporary tables.
Not all backends support this argument.
In particular, permanent tables of the same name are left untouched.

If \code{fail_if_missing} is \code{FALSE}, the call to \code{dbRemoveTable()}
succeeds if the table does not exist.

}

\section{Specification}{


A table removed by \code{dbRemoveTable()} doesn't appear in the list of tables
returned by \code{\link[=dbListTables]{dbListTables()}},
and \code{\link[=dbExistsTable]{dbExistsTable()}} returns \code{FALSE}.
The removal propagates immediately to other connections to the same database.
This function can also be used to remove a temporary table.

The \code{name} argument is processed as follows,
to support databases that allow non-syntactic names for their objects:
\itemize{
\item If an unquoted table name as string: \code{dbRemoveTable()} will do the
quoting,
perhaps by calling \code{dbQuoteIdentifier(conn, x = name)}
\item If the result of a call to \code{\link[=dbQuoteIdentifier]{dbQuoteIdentifier()}}: no more quoting is done
}

}

\examples{
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbExistsTable(con, "iris")
dbWriteTable(con, "iris", iris)
dbExistsTable(con, "iris")
dbRemoveTable(con, "iris")
dbExistsTable(con, "iris")

dbDisconnect(con)
}
\seealso{
Other DBIConnection generics: \code{\link{DBIConnection-class}},
  \code{\link{dbAppendTable}}, \code{\link{dbCreateTable}},
  \code{\link{dbDataType}}, \code{\link{dbDisconnect}},
  \code{\link{dbExecute}}, \code{\link{dbExistsTable}},
  \code{\link{dbGetException}}, \code{\link{dbGetInfo}},
  \code{\link{dbGetQuery}}, \code{\link{dbIsReadOnly}},
  \code{\link{dbIsValid}}, \code{\link{dbListFields}},
  \code{\link{dbListObjects}}, \code{\link{dbListResults}},
  \code{\link{dbListTables}}, \code{\link{dbReadTable}},
  \code{\link{dbSendQuery}}, \code{\link{dbSendStatement}},
  \code{\link{dbWriteTable}}
}
\concept{DBIConnection generics}
