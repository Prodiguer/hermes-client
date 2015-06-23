# -*- coding: utf-8 -*-

"""
.. module:: prodiguer/ops/jobs/api/metric/run_fetch_list.py
   :copyright: @2015 IPSL (http://ipsl.fr)
   :license: GPL/CeCIL
   :platform: Unix, Windows
   :synopsis: Fetches list of all metric groups.

.. moduleauthor:: Mark Conway-Greenslade <momipsl@ipsl.jussieu.fr>


"""
import argparse

import prodiguer_client as prodiguer



# Define command line arguments.
_parser = argparse.ArgumentParser("Fetches list of all metric groups.")


def _main():
    """Main entry point.

    """
    groups = prodiguer.metrics.fetch_list()
    for group in groups:
        prodiguer.log("list :: {}".format(group), module="METRICS")


# Main entry point.
if __name__ == '__main__':
    _parser.parse_args()
    _main()