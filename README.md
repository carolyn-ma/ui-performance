# UI Performance
_Automated shell/js scripts to analyze frontend performance._

## -----------------Bundle size (shell script)---------------

### Purpose
  Single script to automate installing, building, and reporting on:
    1. source-map-explorer
    2. webpack-bundle-analyzer
    3. bundlephobia

### Dependencies
  OS - macOs 
  * node
  * npm
  * brew

### Usage
  ```shell
  git clone git@github.com:carolyn-ma/ui-performance.git
  ```

  ```shell
  cd /[path_to_ui_root]
  ```

  ```shell
  ./[path_to_perf]/ui-performance/bundle-size.sh
  ```

  _*If the command above gives no execution permission error, do_
    ```shell
    chmod -x ./[path_to_perf]/ui-performance/bundle-size.sh
    ```
 
  _*Currently line 34-36 generates a txt file with the link to bundlephobia site, if would like to use the cli functionality to generate a json output, uncomment lines 38-40_

### Future
  Trend analysis on historical reports.


## -----------------Rendering time (javascript)---------------
