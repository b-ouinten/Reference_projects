import { useState } from 'react';

const useFormState = () => {
  const [inputs, setInputs] = useState({});

  const setInputsCustomized = (e) => setInputs({
    ...inputs,
    [e.target.name]: e.target.value,
  });

  return [inputs, setInputsCustomized];
};

export default useFormState;
