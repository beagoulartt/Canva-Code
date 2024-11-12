# Install required packages (if not installed)
#install.packages("digest")
#install.packages("base64enc")

# Load necessary libraries
library(digest)
library(base64enc)


generate_code_verifier <- function(length = 128) {
  valid_chars <- c(letters, LETTERS, 0:9, "-", ".", "_", "~")
  paste0(sample(valid_chars, length, replace = TRUE), collapse = "")
}

# Generate a code_verifier of length between 43 and 128 characters
set.seed(123) # Setting seed for reproducibility (optional)
length <- sample(43:128, 1)
code_verifier <- generate_code_verifier(length)
print(code_verifier)



# Function to generate the code_challenge
generate_code_challenge <- function(code_verifier) {
  # Compute SHA-256 hash of the code_verifier
  sha256_hash <- digest(code_verifier, algo = "sha256", raw = TRUE)
  
  # Encode the hash to URL-safe Base64
  base64_hash <- base64encode(sha256_hash)
  
  # Make the Base64 string URL-safe by replacing '+' with '-', '/' with '_', and trimming '='
  url_safe_base64 <- gsub("\\+", "-", gsub("/", "_", gsub("=", "", base64_hash)))
  
  return(url_safe_base64)     
}

# Example: Using the previously generated code_verifier
code_challenge <- generate_code_challenge(code_verifier)
print(code_challenge)
