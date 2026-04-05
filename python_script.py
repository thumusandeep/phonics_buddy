import os

def update_dart_files():
    # Configuration
    target_dir = 'lib/screens/phonics_dashboard'
    target_pattern = '_blend.dart'
    trigger_line = 'await _player.stop();'
    insertion_text = 'await Future.delayed(const Duration(milliseconds: 150));'

    if not os.path.exists(target_dir):
        print(f"Error: Directory '{target_dir}' not found.")
        return

    files_modified = 0

    # Walk through the directory
    for root, _, files in os.walk(target_dir):
        for file in files:
            if file.endswith(target_pattern):
                file_path = os.path.join(root, file)
                
                with open(file_path, 'r', encoding='utf-8') as f:
                    lines = f.readlines()

                new_lines = []
                was_modified = False

                for i, line in enumerate(lines):
                    new_lines.append(line)
                    
                    # Check if trigger is in line and we aren't creating a duplicate
                    if trigger_line in line:
                        # Ensure we don't add it if it's already there on the next line
                        next_line_exists = (i + 1) < len(lines)
                        if next_line_exists and insertion_text in lines[i+1]:
                            continue
                        
                        # Match indentation of the trigger line
                        indent = line[:line.find(trigger_line)]
                        new_lines.append(f"{indent}{insertion_text}\n")
                        was_modified = True

                if was_modified:
                    with open(file_path, 'w', encoding='utf-8') as f:
                        f.writelines(new_lines)
                    files_modified += 1
                    print(f"Updated: {file_path}")

    print(f"\nTask complete. Total files modified: {files_modified}")

if __name__ == "__main__":
    update_dart_files()
