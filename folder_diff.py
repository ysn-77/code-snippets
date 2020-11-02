
# find ./local_folder -maxdepth 1 -printf '%s %f\n' > files.local && find ./remote_folder -maxdepth 1 -printf '%s %f\n' > files.remote && python folder_diff.py


def hash_from_file(file_path):
    f = open(file_path, "r")
    hash = {}
    for line in f:
        columns = line.split(" ", 1)
        hash[columns[1]] = columns[0]
    return hash

def find_and_print_diff(hash_a, hash_b, same_but_different_size, should_compare_size):
    for key in hash_a:
        if key in hash_b:
            if should_compare_size and hash_a[key] != hash_b[key]:
                same_but_different_size.add(key)
        else:
            print('  ' + key, end='')

def main():
    local_hash = hash_from_file("./files.local")
    remote_hash = hash_from_file("./files.remote")
    same_but_different_size = set()

    print('In local but not remote:')
    find_and_print_diff(local_hash, remote_hash, same_but_different_size, True)
    print('-------------------------------------------------------')
    print('-------------------------------------------------------')
    print('In remote but not in local:')
    find_and_print_diff(remote_hash, local_hash, same_but_different_size, False)
    print('-------------------------------------------------------')
    print('-------------------------------------------------------')
    print('different sizes:')
    for key in same_but_different_size:
        l = int(local_hash[key])
        r = int(remote_hash[key])
        d = abs(l - r)
        print(key + "  l: " + str(l) + "  r: " + str(r) + "  difference: " + str(d))
    print('-------------------------------------------------------')
    print('-------------------------------------------------------')

main()

