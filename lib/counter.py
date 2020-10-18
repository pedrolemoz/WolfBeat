import os

all_files = [os.path.join(path, name) for path, subdirs, files in os.walk(os.getcwd()) for name in files if '.dart' in name and '.g.dart' not in name]

print(f'Number of dart files:',len(all_files))

# for file in all_files:
#     print(file)

global_count = 0

for file_path in all_files:
    count = len(open(file_path,encoding="utf8").readlines())
    global_count = global_count+count

print('Total number of lines of code:',global_count)