import { Feature, FeatureNumberInput, FeatureChoiced, FeatureShortTextInput } from '../../base';
import { FeatureDropdownInput } from '../../dropdowns';

export const reagentname: Feature<string> = {
  name: 'Label of Prescription',
  component: FeatureShortTextInput,
};

export const method_application: FeatureChoiced = {
  name: 'Method of Application',
  component: FeatureDropdownInput,
};


export const unitamt: Feature<number> = {
  name: 'Prescribed Amount',
  component: FeatureNumberInput,
};

export const unitnum: Feature<number> = {
  name: 'Units Per',
  component: FeatureNumberInput,
};
