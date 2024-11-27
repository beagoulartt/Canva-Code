library(httr)
browseURL("https://www.canva.com/api/oauth/authorize?code_challenge_method=s256&response_type=code&client_id=OC-AZL89v-B4Rxg&scope=app:read%20app:write%20design:content:read%20design:meta:read%20design:content:write%20design:permission:read%20design:permission:write%20folder:read%20folder:write%20folder:permission:read%20folder:permission:write%20asset:read%20asset:write%20comment:read%20comment:write%20brandtemplate:meta:read%20brandtemplate:content:read%20profile:read&code_challenge=m2_F7ndm2WhkD3wC8wSwcxa7uh_DSQZLcqMnStni5K4")

#Try to automate this part (Getting the 'code' from the link)

headers = c(
  'Content-Type' = 'application/x-www-form-urlencoded'
)

# Define the body of the request with required parameters
body <- list(
  'grant_type' = 'authorization_code',
  'client_id' = 'OC-AZL89v-B4Rxg',
  'client_secret' = 'cnvcaaL5nJDZHfh_KUN4CMCydsGUo9Xk9mFi5X9LgYtoyR_w63a15990',
  'code' = 'eyJraWQiOiJlODZiMTIwMy1iMWY1LTQ4N2MtYjBiOS0yN2U0MmI2ZjMzZDkiLCJhbGciOiJSUzI1NiJ9.eyJqdGkiOiJURGd3ZktZWkx0NldhalZlc2Vkajl3IiwiY2xpZW50X2lkIjoiT0MtQVpMODl2LUI0UnhnIiwiYXVkIjoiaHR0cHM6Ly93d3cuY2FudmEuY29tIiwiaWF0IjoxNzMyNzQ3NDA5LCJuYmYiOjE3MzI3NDc0MDksImV4cCI6MTczMjc0ODAwOSwiYnVuZGxlcyI6WyJBRkZJIiwiUEFJRCJdLCJ0aWVyIjoicGFpZCIsInJvbGVzIjoiSjdZbUlqd29oRU1xRjBmYTlLOTZFaXdKVEdPQkFKZzE4Qk8wU2VBb0RjWmFoTVhaakp0LXdwREE0OERzVjFxWXJndjhSZyIsImxvY2FsZSI6Ik10Rk1Gck1tVE9vMmNRbXgwYVFyNUp4SXgxVzdFcW9TbXRLLTBrZHl6Qjl2cURsRzkyLV93Ylg0b2RJYWZxbWJ2QjdKRHciLCJzY29wZXMiOlsiYXBwOnJlYWQiLCJhcHA6d3JpdGUiLCJkZXNpZ246Y29udGVudDpyZWFkIiwiZGVzaWduOm1ldGE6cmVhZCIsImRlc2lnbjpjb250ZW50OndyaXRlIiwiZGVzaWduOnBlcm1pc3Npb246cmVhZCIsImRlc2lnbjpwZXJtaXNzaW9uOndyaXRlIiwiZm9sZGVyOnJlYWQiLCJmb2xkZXI6d3JpdGUiLCJmb2xkZXI6cGVybWlzc2lvbjpyZWFkIiwiZm9sZGVyOnBlcm1pc3Npb246d3JpdGUiLCJhc3NldDpyZWFkIiwiYXNzZXQ6d3JpdGUiLCJjb21tZW50OnJlYWQiLCJjb21tZW50OndyaXRlIiwiYnJhbmR0ZW1wbGF0ZTptZXRhOnJlYWQiLCJicmFuZHRlbXBsYXRlOmNvbnRlbnQ6cmVhZCIsInByb2ZpbGU6cmVhZCJdLCJzdWIiOiJvVVZ3bnFUTjRETmtkMGgyQkNUZDZFIiwiYnJhbmQiOiJvQlZ3bjJZazZneGFYSl9jdHh5QWg0Iiwib3JnYW5pemF0aW9uIjpudWxsLCJwa2NlIjoiTjk3NF9UemtSZ3hlN0lEYWtoWDNadEpLcDZMZmVFOXl2bUJNRmh3WHVLZ19Tbmd5ZnNQa2YtNTFlMVB4TU0taVVhUVd2dHFXTFpPQlFoQWhSTFR4MUE3SU5LSjlWQXV6UFpzVnRISGtjMlZoQzR0aCJ9.s-pYXaThTOViRrqSSaKXjBBNv2gn4j9QXEDdShouDMjRgHDk0vE7IPhcfLlFFo8dYe4isvqip_FsqeLZl2OKVNmyAHjdjzGZE0SiloU7D4IDDa_cqtT1BLWwi9SoAtg9mqXxlYprJC0AMshOV0zShxJnoTBO2MaGz0Q-b6oH_XEZXN2H3b2Gs4Ha2cux-sRZQ-yk3HqBuxD2eAoQ677iXAMtxfPr8OAEqD3OtmBAAvVk09qlS3FL0puwi812JAN9iCeIjhqqUkkTuvyrsBzcH_Mjsn9HUx5CEsIte2TGf15LFq6VnBnzRkSjFvcrVw3OZdpILwGGlkd6F_eM91Bi_g',
  'code_verifier' = 'QrJLTd8ZYyXEfnl_q7-OjSP3WYzMGKpt-x_uNDAtvjmAYF7qzGQ3YMH9KNXz7T~gyPjV0sbQkTnWDbQD7mt3Jg'
)

res <- VERB("POST", url = "https://api.canva.com/rest/v1/oauth/token", body = body, add_headers(headers), encode = 'form')

cat(content(res, 'text')) 
# {"access_token":"eyJraWQiOiIyMzY4ZjRhYi00N2ZiLTQwN2MtYjM5Ni00NzgxODcwMjZkN2UiLCJhbGciOiJSUzI1NiJ9.eyJqdGkiOiJKZVNtMFFpZGhnVmNuMFNDeVlXdUtRIiwiY2xpZW50X2lkIjoiT0MtQVpMODl2LUI0UnhnIiwiYXVkIjoiaHR0cHM6Ly93d3cuY2FudmEuY29tIiwiaWF0IjoxNzMyNzQ0NDU0LCJuYmYiOjE3MzI3NDQ0NTQsImV4cCI6MTczMjc1ODg1NCwiYnVuZGxlcyI6WyJBRkZJIiwiUEFJRCJdLCJ0aWVyIjoicGFpZCIsInJvbGVzIjoiMjlEOWxfWmZ6WjFEeXVzclgzU3ZGQVNDa19pZzRaaGdDcVZEQ2QzWHdOcjh3WVBCcDRsX0RJQVlreU9WRUhNblh1a1J2USIsImxvY2FsZSI6IkRfeXJxWDhhUXZXXzV0RmJiM3ZQNG9CUGRZYnVMNlRodGZwMzc4Z3IzMGEtZ3Z3QnNkTDQxTmhUMC1udXBEX01OWDJ5T3ciLCJzY29wZXMiOlsiYXBwOnJlYWQiLCJhcHA6d3JpdGUiLCJkZXNpZ246Y29udGVudDpyZWFkIiwiZGVzaWduOm1ldGE6cmVhZCIsImRlc2lnbjpjb250ZW50OndyaXRlIiwiZGVzaWduOnBlcm1pc3Npb246cmVhZCIsImRlc2lnbjpwZXJtaXNzaW9uOndyaXRlIiwiZm9sZGVyOnJlYWQiLCJmb2xkZXI6d3JpdGUiLCJmb2xkZXI6cGVybWlzc2lvbjpyZWFkIiwiZm9sZGVyOnBlcm1pc3Npb246d3JpdGUiLCJhc3NldDpyZWFkIiwiYXNzZXQ6d3JpdGUiLCJjb21tZW50OnJlYWQiLCJjb21tZW50OndyaXRlIiwiYnJhbmR0ZW1wbGF0ZTptZXRhOnJlYWQiLCJicmFuZHRlbXBsYXRlOmNvbnRlbnQ6cmVhZCIsInByb2ZpbGU6cmVhZCJdLCJzdWIiOiJvVVZ3bnFUTjRETmtkMGgyQkNUZDZFIiwiYnJhbmQiOiJvQlZ3bjJZazZneGFYSl9jdHh5QWg0Iiwib3JnYW5pemF0aW9uIjpudWxsLCJjb2RlX2lkIjoiRS1VZW95R2N6TGhGWnM1MlhmdmZtUSJ9.Om8_PlH3-MPi_9K2Y5xUztdbiErR8ECjqdifsuFy4aMO_6iOwxF36xxVc5PNc_E75IZ0p-PcF9CdL2aw2fTqXga5MdMbwnuxCMDP7-ky7SOR9chnQAK5d3riuUDZfai28cuMptlnuF5jRwHnxdl5IVkNQx5UCnfzlIuCObn4ronPWhLpK7-GhBEpU5NNk1CyUzw5kp9-utcFLgpDNNmMuq49nLKztTyKjNMjIf7yvCLH-Bq5b4DGxbrITzxc0WyfBBM5Qc_T1GErxi7_DqDk10qETAbG9pVlSEscIZvIMXx7m1JXk9ob6VhtKjg2kR18qk_j8JX5SLQbqvk3SzyBTw","refresh_token":"eyJhbGciOiJSU0EtT0FFUC0yNTYiLCJlbmMiOiJBMTI4Q0JDLUhTMjU2Iiwia2lkIjoiZmQ1YmU1MTMtZjAzNy00M2NkLTg3OGEtNjQ1OWJmMGEwNzA4IiwiY3R5IjoiSldUIiwianRpIjoiRUNGazJ3MGgwSzRTY1RodlhsaER4QSIsImNsaWVudF9pZCI6Ik9DLUFaTDg5di1CNFJ4ZyIsImF0X2xlYXN0IjoxMjA5NjAwMDAwfQ.n1vhGTII2q9xd_wl5O03rtLu3i1x6S40wwNykuSfdg_2joBp9MJS5QZ45GialuII81WotWTMx1Uog92Q0ZePklV4rt7r2NRWwvGhUJcr49y03KD5AizByH-LVPtbSpg4LaOATPaBR9Eid-UO1jir9ZRT4XKZ1BeCfhtyxOhAhHg0EufbKzoRza4-qqOkb0-eW7Gl0RNkcOQeY30itUAcz983Tez6pIadL4lP-660JBTLX0RteECs2diA_I9OKnE1sWMdTVHhYyMuRO04IlLSOx6fcFBVt-8RftC25gwdKZrpDJtRvSJLv74d9VmK6WOlw5vrM0zuYNF9uA8BYiJNLw.FCSmIY5oFisgMXOZ83TkVQ.F1erVyzb8gfj28kcvkAIqqV-RGd0F_4HkkWQOiERoachFwFx-_zpD08SgLSAAeJYW7bw_miu8giSyMgW_7Ut_GzXDbuQNt5uB88g5KfkxfjH7so9aJ7Lic3UNA9N7TuFpdmqf_PIwK6DzYbeAZ0uihXU9zhWSB8EVqdJNLDJjDehfza1TfhpgqTx_4WD_0vCzGfh_GW-f1Heu5qAIICX_5LmlkAmauIIUqh7r9vV8cyj8lZrwQCABvHgaxp7wg6hDsnAOWoUb6zKRp1bLzMZOd4RRtZQ1DDwsXt0-BkhVjtYXiGmvKca3t5GHhfKOdQx7IcIuImb5O-Uhmpzt07oytnjBH6HbgpX9L4AlpQeQPoiFlO4-buEM3_0xWI-eT-wHfy6fu6U7NBpsUBA1beYl_WjfSu5v8dbIAfQmgwJnKqH9u1Ui3BSnqmYTBIVFKMhZhphJIIPxheW7ktGi3y8DUDwMYwEK-9FHclhOiSJhnDmMqPQM_kflDskgFYHH_zBWWanOUpWmNmSx0SQCYiZlKESj7yCpOEjgHqk6gjJfPGwetaEkhtLh0D98FAaI8IilB3f-RHT2wLNXxxO8AI7z1-Qi6xmecH8XiPgI-B3t9th_ZjqOxSFpJArC12Hlmu1KmPcZDXDvtH-3o3KJ_ogpeQmg0K6swCdrXrn5TBPKEJiJBnph77PozZfJa40dS8n6uoNXgWmhOHTPHC2n8P_UuoV7JrVYnmP66W9Z1bP7rHXnBg7dcuWVnG9WOiZkQMiCPDypCR41B0x7QjhvsXHuKnAPI11DZVx0CXXyLNtQ5xqh6c6pzm9vJq9gxMKnIGUz0BlQWKblfhkul6HsZOCpxZ_17Wp5pn7YIyoY91VREfhc9THJiqlWixF0dHDaXJBond-Ocu1zd76WI5uSns3TXnrpjSZrBUOxKXM2KhcPs5vBrvjeciEiEQqb1FS-WBrzn-IWQ9eKS8RTzoTVMTmX1Z9MVbDzK917KhMbFt63jDZO7s4RQMQTsHh9KS29OsRVnRgUmukTgVSxsNz0iLKdeeJC5NKeiOK1YXNuWGL9YbnDzCB9scGfWvqV0A1J9JnADcJ6d1yb34d14vC_XvzAWlpmYJe4hrsvo6bVT5jsrOBZPI0dMyvKwkZM1JJzwfTN49O4_QypWgvgZsmbAyjg444DGJEs8u81sT7Q5QZHUzXcKrLr63-v5-oGZystE3667GnNAKE3qOuoXUjA1Ciur-yjakZub65GD_qyR-wVDRsL_KwsfdfyPU3L0bX4JOZxY70djEnV3fehFF8h_wRLEeZRj3qPFBevkPvSTYnF0_UiMVAecYN1wRHK_wVuN7poU5fzd_b2AEV1Q0sQxyBGHWux6Qqg_8iaGZbn_O4-jwfSEUXPOFbWHS0OWHKYRyIDJvfQnC9npCThj3PXV0M43r9_DTeG6jlKf17kgWpKaMbnZqh0ecbNOdMlWHJUftSLDBiQDJkgutIMCvnQTyLW3c9stpfYewCw1XZBPnZOUpihBhS6SNlQP_Yi9TGe5-JTXxHQeqNZcFAAdJaxr4wFKRkMTJ0uCZvcBBSodXB_sz-gp29WqIczLdRVoJwjIX_SHz-vFTWyEFjNmH8d7WA1VfvOduotcQfURirRvUCe06PZksxsg9syZeyPt0jCCx6h4ekbCaG3hbXjoMSNvu5nNW9Wri9RdE1DuAP3RxF8IYbVmEF5hvzn0uFChqR8IaNkELilPdJMXSpAnJwLK2wejxs1drpP0Jr6MAxjDgOqYw.16irA4SLPOS1dLFtXxbtug","token_type":"Bearer","expires_in":14400,"scope":"app:read app:write design:content:read design:meta:read design:content:write design:permission:read design:permission:write folder:read folder:write folder:permission:read folder:permission:write asset:read asset:write comment:read comment:write brandtemplate:meta:read brandtemplate:content:read profile:read"}

res <- content(res, "text", encoding = "UTF-8")

#Extracting the access token and putting it together after 'Bearer'
# # Parse the JSON response
response_list <- jsonlite::fromJSON(res)
# 
# # Extract the URL
accesstoken <- response_list$access_token

# Correctly format headers
headers <- c(
  'Authorization' = paste ('Bearer', accesstoken)
)

# Make the request with the correct headers
res <- VERB("GET", url = "https://api.canva.com/rest/v1/brand-templates/DAGUVydZ3L4/dataset", add_headers(.headers = headers))

# Output the content
cat(content(res, 'text')) 



#####################################





library(httr)
library(jsonlite)

# Example data frame for a bar chart
slide5_monthlyVisits <- data.frame(
  Category = c("Group", "XXXX", "Bob", "PoopyHead", "Poop McButt"),
  Value = c(0, 20, 1500, 35, 1130),
  Value2 = c(2000, 220, 150, 135, 110)
)
# Example data frame for a bar chart
slide5_monthlyVisitsTitle <- data.frame(
  Category = c("Title1"),
  Value = c("Title2"),
  Value2 = c("Title3")
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

# Canva API endpointS
url <- "https://api.canva.com/rest/v1/autofills"

# API Token (replace with your actual token)
api_token <- accesstoken
convert_to_chart_structure <- function(df, brand_template_id, slide_title) {
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
                list(type = "number", value = df$Value2[i]),     # Use df for data extraction
                list(type = "string", value = df$Value3[i])     # Use df for data extraction
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


# Specify the slide title
slide_title <- "Monthly Visits Overview"

# Convert the data frame to a structured payload including the title
body <- convert_to_chart_structure(slide5_monthlyVisits, brand_template_id, slide_title)

# Create the POST request body
body_json <- toJSON(body, auto_unbox = TRUE, pretty = TRUE)

# Make the POST request
response <- POST( 
  url,
  body = body_json,
  add_headers(.headers = headers),
  encode = "raw"
)











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
  'Authorization' = paste ('Bearer', accesstoken),
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
  'Authorization' = paste ('Bearer', accesstoken)
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
