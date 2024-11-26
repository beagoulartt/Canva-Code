

library(httr)
library(jsonlite)

# Example data frame for a bar chart
slide5_monthlyVisits <- data.frame(
  Category = c("Group", "XXXX", "Bob", "PoopyHead", "Poop McButt"),
  Value = c(0, 20, 1500, 35, 1130),
  Value2 = c(2000, 220, 150, 135, 110)
)
    
# # Convert data frame to Canva chart data format
# canva_chart_data <- list(
#   type = "chart",
#   slide5_monthlyVisits = list(
#     rows = lapply(1:nrow(slide5_monthlyVisits), function(i) {
#       list(
#         cells = list(
#           list(type = "string", value = slide5_monthlyVisits$Category[i]),
#           list(type = "number", value = slide5_monthlyVisits$Value[i])
#         )
#       )
#     })
#   )
# )
# 
# # Convert to JSON
# #chart_json <- toJSON(canva_chart_data, auto_unbox = TRUE, pretty = TRUE)
# #cat(chart_json)  # Print JSON for review

# Canva API endpoint
url <- "https://api.canva.com/rest/v1/autofills"

# API Token (replace with your actual token)
api_token <- "eyJraWQiOiIyMzY4ZjRhYi00N2ZiLTQwN2MtYjM5Ni00NzgxODcwMjZkN2UiLCJhbGciOiJSUzI1NiJ9.eyJqdGkiOiJTTjhLa2NKNmZqTGNzOGpxWV9TX0hBIiwiY2xpZW50X2lkIjoiT0MtQVpMODl2LUI0UnhnIiwiYXVkIjoiaHR0cHM6Ly93d3cuY2FudmEuY29tIiwiaWF0IjoxNzMyNjQ4NTk5LCJuYmYiOjE3MzI2NDg1OTksImV4cCI6MTczMjY2Mjk5OSwiYnVuZGxlcyI6WyJBRkZJIiwiUEFJRCJdLCJ0aWVyIjoicGFpZCIsInJvbGVzIjoiT2ZWaUtUYWh6eVQwbDJqSklzUkZSSktSUDRoenkzVnlhdElfc3FRZDJra0xxWjZQcnhHcDFNOHZjVlBWWXJCZzBneFZhUSIsImxvY2FsZSI6IjQ5VVkxQVgyemxTWUhkNW5TTmxqbDQ2aXNiNjl4YWR5NDh2Y2dqUl81RS1KNXBPaDBVRVFJcmF4b3RCY0ZsVjFxTDY5cXciLCJzY29wZXMiOlsiYXBwOnJlYWQiLCJhcHA6d3JpdGUiLCJkZXNpZ246Y29udGVudDpyZWFkIiwiZGVzaWduOm1ldGE6cmVhZCIsImRlc2lnbjpjb250ZW50OndyaXRlIiwiZGVzaWduOnBlcm1pc3Npb246cmVhZCIsImRlc2lnbjpwZXJtaXNzaW9uOndyaXRlIiwiZm9sZGVyOnJlYWQiLCJmb2xkZXI6d3JpdGUiLCJmb2xkZXI6cGVybWlzc2lvbjpyZWFkIiwiZm9sZGVyOnBlcm1pc3Npb246d3JpdGUiLCJhc3NldDpyZWFkIiwiYXNzZXQ6d3JpdGUiLCJjb21tZW50OnJlYWQiLCJjb21tZW50OndyaXRlIiwiYnJhbmR0ZW1wbGF0ZTptZXRhOnJlYWQiLCJicmFuZHRlbXBsYXRlOmNvbnRlbnQ6cmVhZCIsInByb2ZpbGU6cmVhZCJdLCJzdWIiOiJvVVZ3bnFUTjRETmtkMGgyQkNUZDZFIiwiYnJhbmQiOiJvQlZ3bjJZazZneGFYSl9jdHh5QWg0Iiwib3JnYW5pemF0aW9uIjpudWxsLCJjb2RlX2lkIjoiM0tpRWxscDBJTXB5WTNZTTV5SkUyZyJ9.OlA_WVeGO8qAw1TVU8z8e6HX7VQ4w_gHkwLe8sVWu8tgkaZuYJ9AEFKOM9YvB6vkpC_MqgJSpHNhRQt7iu8VTeCeZ51HILI-vnPpoEoc7D4IJhtaanmxjZvgxJYtgzobYlZC-oZ-MOg1Sb6i3FBztnv1zPoOCZe-h3uiMNcmARBC5xGL7S5e-w-dtnjkMFis06hIEIvlvcPao7FKk37x6HEClFWgVsBvCme5RmjOnhMtJVzvg8zdoyDKjKmzlkz9K4qraUEeFnn5VFyHqBtHrADhZlWBNSuLjsnO8nUMT0amt24OG3kHF5vT0KqpoBqtznr_vPLb-dDbwuLRDlIMCA"

convert_to_chart_structure <- function(df, brand_template_id) {
  # Capture the name of the dataframe dynamically
  df_name <- as.character(deparse(substitute(df)))  # This captures the name of the input dataframe
  

# Brand template ID
brand_template_id <- "DAGUVydZ3L4"

result <- list(
  brand_template_id = brand_template_id,
  data = setNames(
    list(
      list(
        type = "chart",
        chart_data = list(
          rows = lapply(1:nrow(df), function(i) {
            list(
              cells = list(
                list(type = "string", value = df$Category[i]), # Use df for data extraction
                list(type = "number", value = df$Value[i]),     # Use df for data extraction
                list(type = "number", value = df$Value2[i])     # Use df for data extraction
                
              )
            )
          })
        )
      )
    ),
    df_name # Dynamically assign the name of the dataframe as the key
  )
)

return(result)  # Return the final result
}

# Convert the data frame
body <- convert_to_chart_structure(slide5_monthlyVisits,brand_template_id)

# Create the POST request body
# body <- list(
#   brand_template_id = brand_template_id,
#   data = list(
#     slide5_monthlyVisits = list(
#       type = "chart",
#       chart_data = list(
#         rows = lapply(1:nrow(slide5_monthlyVisits), function(i) {
#           list(
#             cells = list(
#               list(type = "string", value = slide5_monthlyVisits$Category[i]),
#               list(type = "number", value = slide5_monthlyVisits$Value[i])
#             )
#           )
#         })
#       )
#     )
#   )
# )
toJSON(body, auto_unbox = TRUE, pretty = TRUE)

# Define headers
headers <- c(
  'Authorization' = "Bearer eyJraWQiOiIyMzY4ZjRhYi00N2ZiLTQwN2MtYjM5Ni00NzgxODcwMjZkN2UiLCJhbGciOiJSUzI1NiJ9.eyJqdGkiOiIyVEVPYkQyeVFEZDlUbzY3TjZtcW9BIiwiY2xpZW50X2lkIjoiT0MtQVpMODl2LUI0UnhnIiwiYXVkIjoiaHR0cHM6Ly93d3cuY2FudmEuY29tIiwiaWF0IjoxNzMyNjU5ODU1LCJuYmYiOjE3MzI2NTk4NTUsImV4cCI6MTczMjY3NDI1NSwiYnVuZGxlcyI6WyJBRkZJIiwiUEFJRCJdLCJ0aWVyIjoicGFpZCIsInJvbGVzIjoiNXpUdHZISFRFdVcxVDBEdnhwVWNILUVuNXgyanVFVXk1OHZLVF9ub2RSb1FxMkNNQzU2YVU1NHk3aWNkSV94QXBfZkdHdyIsImxvY2FsZSI6ImdQcGJFaXBHbEtIbXhwMHhEaG9GWjZLNVRmZGJkOXRaVDBUX1JLRXJkZXpMbUtobFpSWWR1bktEQ2d5MnRWNzNjbW02UGciLCJzY29wZXMiOlsiYXBwOnJlYWQiLCJhcHA6d3JpdGUiLCJkZXNpZ246Y29udGVudDpyZWFkIiwiZGVzaWduOm1ldGE6cmVhZCIsImRlc2lnbjpjb250ZW50OndyaXRlIiwiZGVzaWduOnBlcm1pc3Npb246cmVhZCIsImRlc2lnbjpwZXJtaXNzaW9uOndyaXRlIiwiZm9sZGVyOnJlYWQiLCJmb2xkZXI6d3JpdGUiLCJmb2xkZXI6cGVybWlzc2lvbjpyZWFkIiwiZm9sZGVyOnBlcm1pc3Npb246d3JpdGUiLCJhc3NldDpyZWFkIiwiYXNzZXQ6d3JpdGUiLCJjb21tZW50OnJlYWQiLCJjb21tZW50OndyaXRlIiwiYnJhbmR0ZW1wbGF0ZTptZXRhOnJlYWQiLCJicmFuZHRlbXBsYXRlOmNvbnRlbnQ6cmVhZCIsInByb2ZpbGU6cmVhZCJdLCJzdWIiOiJvVVZ3bnFUTjRETmtkMGgyQkNUZDZFIiwiYnJhbmQiOiJvQlZ3bjJZazZneGFYSl9jdHh5QWg0Iiwib3JnYW5pemF0aW9uIjpudWxsLCJjb2RlX2lkIjoiWGxzX1VOUWRTV0hXdjBUQjRKNFVTZyJ9.HKJSmp3UwHjzIVMMvlGhuw9q7UqAUObBoCPUiWG6pfjRKNLGBaFJVEyOrQedrXrVwno2iGFBnQdXOKRRUglpqY6dZ9wWfaoAc_v4Z8vjoEdkE1atU0DjhGblOE-QfNk-Gdt-lw769aRy87eVmAq13iMnYykaZzQGh51vIe7oGUgPXfU17PdA6VApS3Vm-8tTC4PTcRfJ5hAmk-KjUO-LoMRsnnfONSPGm_hnnf2UvV_0gVlGn3OtLY-2XiiexORjX15Tyl1EAhL_NSW2gjYn3NM0KduA9vDKsGMmQ_Q5RNZjDfrc2qqaK-4ozM6RMUpqFSvPMzY_9YKSWDVsLiOLtg",
  'Content-Type' = 'application/json'
)

# Make the POST request
response <- POST(
  url,
  body = toJSON(body, auto_unbox = TRUE),
  add_headers(.headers = headers),
  encode = "raw"
)

# Check response
response_content <- content(response, "text", encoding = "UTF-8")
cat(response_content)

# Parse the JSON response into a list
response_list <- jsonlite::fromJSON(response_content)

# Extract the job id
job_id <- response_list$job$id

# Print the job id
print(job_id)

Sys.sleep(20)

headers = c(
  'Authorization' = 'Bearer eyJraWQiOiIyMzY4ZjRhYi00N2ZiLTQwN2MtYjM5Ni00NzgxODcwMjZkN2UiLCJhbGciOiJSUzI1NiJ9.eyJqdGkiOiIyVEVPYkQyeVFEZDlUbzY3TjZtcW9BIiwiY2xpZW50X2lkIjoiT0MtQVpMODl2LUI0UnhnIiwiYXVkIjoiaHR0cHM6Ly93d3cuY2FudmEuY29tIiwiaWF0IjoxNzMyNjU5ODU1LCJuYmYiOjE3MzI2NTk4NTUsImV4cCI6MTczMjY3NDI1NSwiYnVuZGxlcyI6WyJBRkZJIiwiUEFJRCJdLCJ0aWVyIjoicGFpZCIsInJvbGVzIjoiNXpUdHZISFRFdVcxVDBEdnhwVWNILUVuNXgyanVFVXk1OHZLVF9ub2RSb1FxMkNNQzU2YVU1NHk3aWNkSV94QXBfZkdHdyIsImxvY2FsZSI6ImdQcGJFaXBHbEtIbXhwMHhEaG9GWjZLNVRmZGJkOXRaVDBUX1JLRXJkZXpMbUtobFpSWWR1bktEQ2d5MnRWNzNjbW02UGciLCJzY29wZXMiOlsiYXBwOnJlYWQiLCJhcHA6d3JpdGUiLCJkZXNpZ246Y29udGVudDpyZWFkIiwiZGVzaWduOm1ldGE6cmVhZCIsImRlc2lnbjpjb250ZW50OndyaXRlIiwiZGVzaWduOnBlcm1pc3Npb246cmVhZCIsImRlc2lnbjpwZXJtaXNzaW9uOndyaXRlIiwiZm9sZGVyOnJlYWQiLCJmb2xkZXI6d3JpdGUiLCJmb2xkZXI6cGVybWlzc2lvbjpyZWFkIiwiZm9sZGVyOnBlcm1pc3Npb246d3JpdGUiLCJhc3NldDpyZWFkIiwiYXNzZXQ6d3JpdGUiLCJjb21tZW50OnJlYWQiLCJjb21tZW50OndyaXRlIiwiYnJhbmR0ZW1wbGF0ZTptZXRhOnJlYWQiLCJicmFuZHRlbXBsYXRlOmNvbnRlbnQ6cmVhZCIsInByb2ZpbGU6cmVhZCJdLCJzdWIiOiJvVVZ3bnFUTjRETmtkMGgyQkNUZDZFIiwiYnJhbmQiOiJvQlZ3bjJZazZneGFYSl9jdHh5QWg0Iiwib3JnYW5pemF0aW9uIjpudWxsLCJjb2RlX2lkIjoiWGxzX1VOUWRTV0hXdjBUQjRKNFVTZyJ9.HKJSmp3UwHjzIVMMvlGhuw9q7UqAUObBoCPUiWG6pfjRKNLGBaFJVEyOrQedrXrVwno2iGFBnQdXOKRRUglpqY6dZ9wWfaoAc_v4Z8vjoEdkE1atU0DjhGblOE-QfNk-Gdt-lw769aRy87eVmAq13iMnYykaZzQGh51vIe7oGUgPXfU17PdA6VApS3Vm-8tTC4PTcRfJ5hAmk-KjUO-LoMRsnnfONSPGm_hnnf2UvV_0gVlGn3OtLY-2XiiexORjX15Tyl1EAhL_NSW2gjYn3NM0KduA9vDKsGMmQ_Q5RNZjDfrc2qqaK-4ozM6RMUpqFSvPMzY_9YKSWDVsLiOLtg'
)

res <- VERB("GET", url = paste0("https://api.canva.com/rest/v1/autofills/",job_id), add_headers(headers))

res <- content(res, "text", encoding = "UTF-8")

# Parse the JSON response
response_list <- jsonlite::fromJSON(res)

# Extract the URL
design_url <- response_list$job$result$design$url

# Print the URL
print(design_url)

# Open the URL in the default web browser
browseURL(design_url)
