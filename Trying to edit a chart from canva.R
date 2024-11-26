#install.packages("jsonlite")

library(jsonlite)
library(httr)


# Define headers
headers <- c(
  'Authorization' = 'Bearer eyJraWQiOiIyMzY4ZjRhYi00N2ZiLTQwN2MtYjM5Ni00NzgxODcwMjZkN2UiLCJhbGciOiJSUzI1NiJ9.eyJqdGkiOiJJeDRiNjhzQ1ZGQ1ZqMUNZSjlSdi13IiwiY2xpZW50X2lkIjoiT0MtQVpMODl2LUI0UnhnIiwiYXVkIjoiaHR0cHM6Ly93d3cuY2FudmEuY29tIiwiaWF0IjoxNzMyNjQxMzA2LCJuYmYiOjE3MzI2NDEzMDYsImV4cCI6MTczMjY1NTcwNiwiYnVuZGxlcyI6WyJBRkZJIiwiUEFJRCJdLCJ0aWVyIjoicGFpZCIsInJvbGVzIjoicjNUWXhtdmRlZ3FhZUNMODlhUGcyTTZ5NXhscGZkaXVpZ0pYOGtwNTZlM3JfaGZ3a2tRcE1yQ2RHdGRXQWU5WVk1TTNLQSIsImxvY2FsZSI6InFEeUpkRDlENnQzWEhhX3BVRlptSVZCbTNBdm5VRWFzUDBoWXpkLTU0OHRHZGZqamppN1N4Ry1kZVNSRTRwQ3ljQ0xyNEEiLCJzY29wZXMiOlsiYXBwOnJlYWQiLCJhcHA6d3JpdGUiLCJkZXNpZ246Y29udGVudDpyZWFkIiwiZGVzaWduOm1ldGE6cmVhZCIsImRlc2lnbjpjb250ZW50OndyaXRlIiwiZGVzaWduOnBlcm1pc3Npb246cmVhZCIsImRlc2lnbjpwZXJtaXNzaW9uOndyaXRlIiwiZm9sZGVyOnJlYWQiLCJmb2xkZXI6d3JpdGUiLCJmb2xkZXI6cGVybWlzc2lvbjpyZWFkIiwiZm9sZGVyOnBlcm1pc3Npb246d3JpdGUiLCJhc3NldDpyZWFkIiwiYXNzZXQ6d3JpdGUiLCJjb21tZW50OnJlYWQiLCJjb21tZW50OndyaXRlIiwiYnJhbmR0ZW1wbGF0ZTptZXRhOnJlYWQiLCJicmFuZHRlbXBsYXRlOmNvbnRlbnQ6cmVhZCIsInByb2ZpbGU6cmVhZCJdLCJzdWIiOiJvVVZ3bnFUTjRETmtkMGgyQkNUZDZFIiwiYnJhbmQiOiJvQlZ3bjJZazZneGFYSl9jdHh5QWg0Iiwib3JnYW5pemF0aW9uIjpudWxsLCJjb2RlX2lkIjoidmtpNklMRDBTYS1zeXNsc0JBMEFzZyJ9.SxqY8Sx6rQPB4gXMPkUoCad7kPbAi5gwRM2njDKSmIQdCnLFWJ5-U0Ea22QirCdrQIelBug757QrPqzxs8vZPICl822wjF9cNKLTGY4LTJCwFF-zfXL06AQVPtu30JDhyOCbKZyA1XPjafvoWW7pdVjAEn4NCrY52Hci7SAUNepZPBhIYye4GPKCeFhoC07twNE5i2iJZYoZyXjlyaO9D-oaBYPy0g7rG7M9-C-vKmxX5F7-LV-RyOO0TP8_Mr5rRXvaa6ssthzon0eIUJm28Y0yAsfvXP8ixkx_qnpL6721vIhr00GEI7xS1p98XQzJuKydp2sm8ZG3YH3TUQJFxA',
  'Content-Type' = 'application/json'
)

# Define body
body <- list(
  brand_template_id = "DAGUVydZ3L4",
  title = "2024-11-26, 1:27pm - November 2024 MH Board Meeting Slide Deck",
  data = list(
    MonthYear = list(
      type = "text",
      text = "December 2024"
    ),
    slide3_visits = list(
      type = "text",
      text = "2191098"
    ),
    slide5_monthlyVisits = list(
      type = "chart",
      chart_data = list(
        rows = list(
          list(
            cells = list(
              list(type = "string", value = "Date"),
              list(type = "string", value = "Number of People")
            )
          ),
          list(
            cells = list(
              list(type = "string", value = "2024-10-19"),
              list(type = "number", value = 5)
            )
          ),
          list(
            cells = list(
              list(type = "string", value = "2024-12-12"),
              list(type = "number", value = 10)
            )
          ),
          list(
            cells = list(
              list(type = "string", value = "2024-11-10"),
              list(type = "number", value = 15)
            )
          )
        )
      )
    )
  )
)

# Serialize the body to JSON
json_body <- toJSON(body, auto_unbox = TRUE, pretty = TRUE)

# Make the POST request
res <- POST(
  url = "https://api.canva.com/rest/v1/autofills",
  body = json_body,
  add_headers(.headers = headers),
  encode = "raw"
)

# Display the response content
cat(content(res, "text", encoding = "UTF-8"))