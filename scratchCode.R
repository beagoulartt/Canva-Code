convert_to_chart_structure <- function(df, brand_template_id) {
  # Convert the data frame to the desired list structure, including a nested key for the chart data
  df_name <- deparse(substitute(df))  # Capture the name of the dataframe dynamically
  
  result <- list(
    brand_template_id = brand_template_id,  # Use the provided brand_template_id
    data = list(  # Wrap the chart data inside a 'data' object
      # Use the name of the data frame variable dynamically for the key
      setNames(list(  # Dynamically set the key name as df_name
        type = "chart",
        chart_data = list(
          rows = lapply(1:nrow(df), function(i) {
            list(
              cells = list(
                list(type = "string", value = df$Category[i]),
                list(type = "number", value = df$Value[i])
              )
            )
          })
        )
      ), df_name)  # Use the name of the dataframe as the key
    )
  )
  
  return(result)
}



# Example usage with your data frame
slide5_monthlyVisits <- data.frame(
  Category = c("Group", "A", "B", "C", "X"),
  Value = c(0, 100, 1, 17, 13)
)

# Convert the data frame
slide5_monthlyVisits_converted <- convert_to_chart_structure(slide5_monthlyVisits,brand_template_id)

# Print the result
print(slide5_monthlyVisits_converted)
