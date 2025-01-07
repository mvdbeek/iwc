import json


def get_lines():
    lines = [["trsID", "name", "collections", "annotation"]]
    with open("workflow_manifest.json") as manifest_fh:
        manifest = json.load(manifest_fh)
    for entry in manifest:
        for workflow in entry["workflows"]:
            lines.append([workflow["trsID"], workflow["definition"]["name"], ",".join(workflow["collections"]), workflow["definition"]["annotation"].replace("\n", " ")])
    lines = sorted(lines, key=lambda x: x[0].casefold())
    return lines



if __name__ == "__main__":
    lines = get_lines()
    with open("spreadsheet.tsv", "w") as out:
        for line in lines:
            line = "\t".join(line) + "\n"
            out.write(line)


