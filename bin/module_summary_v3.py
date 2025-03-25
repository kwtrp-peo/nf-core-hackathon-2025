#import modules
import pandas as pd
import os
import argparse

# Parse command-line arguments
parser = argparse.ArgumentParser(description="Process Mash txt results and combine them into a single TSV file")
parser.add_argument("--input_dir", required=True, help="Path to the directory containing result files - ***check how the output folder from mashscreen is named***")
parser.add_argument("--output_file", required=True, help="Path to save the combined TSV output file")

args = parser.parse_args()
input_dir = args.input_dir
output_file = args.output_file

# Ensure input directory exists
if not os.path.exists(input_dir):
    print(f"Error: Input directory '{input_dir}' does not exist.")
    exit()

# Get all .txt files in the input directory
files = [f for f in os.listdir(input_dir) if f.endswith(".txt")] 

# Check if there are files to process
if not files:
    print("No .txt files found in the input directory.")
    exit()

# create an empty df to store the combined results
combined_df = pd.DataFrame(columns=["Sample_ID", "Organism_Identified"])

# Loop through each file and extract data
for file in files:
    file_path = os.path.join(input_dir, file)

    try:
        df1 = pd.read_csv(file_path, sep="\t", header=None)

        df2 = df1.iloc[:2, [5]]  # Extract first two rows of column 5
        sample_id = os.path.splitext(file)[0].split(".")[0]  # Extract only the core name (e.g., "run1_bc01")
        df2.insert(0, "Sample_ID", sample_id)  # Insert Sample_ID
        df2.columns = ["Sample_ID", "Organism_Identified"]  # Rename columns

        # Append data to the combined DataFrame
        combined_df = pd.concat([combined_df, df2], ignore_index=True)

        print(f"Processed: {file} → Sample_ID: {sample_id}")

    except Exception as e:
        print(f"Error processing {file}: {e}")

# Save all results to a single TSV file
if not combined_df.empty:
    os.makedirs(os.path.dirname(output_file), exist_ok=True)  # Ensure output directory exists
    combined_df.to_csv(output_file, sep="\t", index=False)
    print(f"Combined results saved to: {output_file}")
else:
    print("No valid data to save.")