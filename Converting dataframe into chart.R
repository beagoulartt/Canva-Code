convert_to_chart_data <- function(df) {
  # Create an empty list to store chart data
  chart_data <- list(
    rows = list()
  )
  
  # Add the header row: create cell entries for column names
  header_row <- list(
    cells = lapply(names(df), function(col_name) {
      list(type = "string", value = col_name)
    })
  )
  chart_data$rows[[1]] <- header_row
  
  # Loop through each row of the dataframe and create a list of cells
  for (i in 1:nrow(df)) {
    row_cells <- lapply(1:ncol(df), function(j) {
      value <- df[i, j]
      col_type <- typeof(value)
      
      # Check for specific types and assign type and value accordingly
      if (col_type == "character" || col_type == "factor") {
        return(list(type = "string", value = as.character(value)))
      } else if (col_type == "logical") {
        return(list(type = "boolean", value = as.logical(value)))
      } else if (col_type == "double" || col_type == "integer") {
        return(list(type = "number", value = as.numeric(value)))
      } else {
        return(list(type = "string", value = ""))
      }
    })
    
    # Add the row to the chart_data list in the expected format
    chart_data$rows[[i + 1]] <- list(cells = row_cells)
  }
  
  return(chart_data)
}

# Example usage with the 'data' dataframe
data <- data.frame(
  `Geographic Region` = c("Asia Pacific", "EMEA"),
  `Sales (millions AUD)` = c(10.2, 13.8),
  `Target met?` = c(TRUE, FALSE),
  `Date met` = as.Date(c("2024-11-18", NA))
)

# Get the chart_data as a list
chart_data <- convert_to_chart_data(data)

# Convert chart_data to JSON format for output
library(jsonlite)
json_string <- toJSON(chart_data, pretty = TRUE)
cat(json_string)
