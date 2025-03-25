import pandas as pd
import os 

def extract_file_name(file):
    file_name=os.path.splitext(os.path.basename(file))[0]
    return file_name

def extract_results(file):
    df1=pd.read_csv(file,sep="\t")
    df2 = df1.iloc[:0, [5]]  # Extract first two rows of column at index 5
    df2.insert(0, "Sample_ID", extract_file_name(file))  # Insert Sample_ID as first column
    df2.columns = ["Sample_ID", "Organism Identified"]  # Rename columns
    
    return df2

# Example usage
file_path = "/workspaces/nf-core-hackathon-2025/test_data/mash_output/run1_bc01.mash.results.txt"
df2 = extract_results(file_path)
print(df2)

